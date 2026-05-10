# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロダクト概要
1p
`band-scheduler` は、バンドメンバー各自の不可/空き時間を共有カレンダー上で可視化し、練習日程の合意形成を支援する Flutter Web アプリ。プロダクト仕様の正本は `docs/PRD.md`（スコープ・データモデル・UX 判断はすべてここが基準）。構造に関わる変更を提案する前に必ず一読すること。MVP の現状は In-Memory リポジトリで動作しており、Firebase バックエンド（Firestore + メールリンク Auth + Hosting）は **未配線**。残作業は GitHub Issues #3–#13 にチケット化済み。

## よく使うコマンド

Flutter SDK は `mise.toml` で固定（Flutter 3.41.9、Web 専用）。`mise activate` がシェルに入っている前提なので、`flutter` / `dart` はそのまま PATH 経由で呼んで OK（`mise exec --` を前置する必要はない）。

```sh
flutter pub get                                          # 依存解決
dart run build_runner build                              # コード生成（freezed / json_serializable / go_router_builder / mockito）
flutter analyze                                          # 静的解析（very_good_analysis）
flutter test                                             # テスト全実行
flutter test test/domain/common_availability_test.dart   # 単一ファイル実行
flutter test --plain-name 'commonAvailability'           # 名前パターンで絞り込み
flutter run -d chrome                                    # Chrome で起動
flutter build web --release                              # 本番ビルド（出力: build/web）
```

freezed / mockito / router 系のアノテーションを変更したら `dart run build_runner build` を再実行。「stale outputs」エラーが出たら `--delete-conflicting-outputs` を付けて再生成。

## アーキテクチャ

レイヤード構成。依存方向は厳密に `ui → domain → data`。

- **`lib/data/`** — `models/` は PRD §5 の Firestore スキーマを写した `@freezed` データクラス。`repositories/` は抽象インタフェースで、デフォルト実装は `InMemoryXxxRepository`。後日 Firestore 実装を追加し、Riverpod の override で UI 層に手を入れずに差し替える前提。
- **`lib/domain/`** — 純 Dart のロジックのみ。**Flutter の import は禁止**。中核は `commonAvailability()`（PRD §5 のアルゴリズム: 全メンバーの busy 区間を和集合化 → window から差分）。`flutter_test` 不要で単体テストできる純度を保つこと。
- **`lib/ui/`** — Riverpod の `ConsumerWidget` 群。`providers.dart` で各リポジトリを `Provider` で公開し、`members` / `busy_slots` / `practices` をバンド単位の `StreamProvider` で配信。`bandIdProvider` は MVP では `'default'` 固定（PRD §4.2、マルチバンド化は Phase 3）。
- **`lib/router.dart`** — `go_router_builder` による typed routes。各ルートは `GoRouteData` の派生クラスに **生成** mixin `with $RouteName` を混ぜる（v4 系の規約。アンダースコア付き `_$RouteName` ではコード生成が失敗する）。生成物は隣の `router.g.dart`。
- **`lib/app.dart` / `lib/main.dart`** — `ProviderScope` で `BandSchedulerApp` を包み、`MaterialApp.router` に `createRouter()` を渡している。`main()` は `runApp` の前に `initializeDateFormatting('ja')` を呼ぶ（画面で `DateFormat(..., 'ja')` を使うため）。

過去にハマった注意点が 2 つ:

1. **`AvailabilityInterval` typedef**（`lib/domain/common_availability.dart`）は、Flutter の `material.dart` が export する `Interval` と名前衝突するためにこの名前にしている。`Interval` に戻さないこと。
2. **UI の 2 モード入力は常に `busy_slots` に正規化**して保存する（PRD §5 の対応表）。「空き時間」モードは、その日の 00:00–24:00 ウィンドウから選択された空き区間を引いた残りを保存する。`source_input_mode` は監査・編集 UI 復元用であり、共通空き時間の計算には**絶対に使わない**。

## Lint 設定（`analysis_options.yaml`）

`package:very_good_analysis` を継承した上で、MVP 雛形段階の現実解として `public_member_api_docs` と `lines_longer_than_80_chars` を無効化（コードベース安定後に再検討）。生成ファイル（`*.g.dart` / `*.freezed.dart` / `*.mocks.dart`）は解析対象外。`flutter analyze` で issues 0 件になることをコミット前のハードゲートとして扱う。

## 規約

- **ブランチ名**: `chore/`, `feat/`, `fix/` のいずれかでプレフィックスする。
- **コミット / PR タイトル**: Conventional Commits（`feat(scope): ...`, `chore: ...`）。利用中の scope は `data`, `domain`, `ui`。
- **新規リポジトリ追加時**: 抽象インタフェースと `InMemoryXxxRepository` をセットで定義し、`lib/ui/providers.dart` の `Provider` に登録する。UI 層は抽象型のみに依存させる。
- **新規モデル追加時**: `lib/data/models/busy_slot.dart` をひな形に `@freezed` + `fromJson`/`toJson` で書く。Firestore 実装が入る段階で `Timestamp ⇄ DateTime` の `JsonConverter` を後付けする予定なので、今は `DateTime` フィールドのまま素直に持つ。
- **生成ファイルはリポジトリにコミットする運用**（CI で都度生成しない）。アノテーションを編集したら build_runner を回して、生成された `*.freezed.dart` / `*.g.dart` / `*.mocks.dart` も同じコミットに含める。
