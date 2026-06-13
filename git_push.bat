@echo off
chcp 65001 > nul
cd /d "%~dp0"

echo === index.lock クリーンアップ ===
if exist .git\index.lock (
    del .git\index.lock
    echo index.lock を削除しました
)

echo.
echo === git add ===
git add .
if errorlevel 1 goto error

echo.
echo === git commit ===
git commit -m "feat: 初回コミット - 教材9ファイル追加

- sql_guide_v12.html                : SQL基礎教材
- sql_advanced_1_transaction.html   : SQL中級 トランザクション・ロック編
- sql_advanced_2_explain_cte.html   : SQL中級〜上級 EXPLAIN・CTE・VIEW編
- er_guide_v5.html                  : ER図基礎教材
- index_guide_v5.html               : インデックス教材
- vue_guide.html                    : Vue3基礎〜応用
- vue_typescript_guide.html         : TypeScript+Vue3
- json_yaml_guide.html              : JSON/YAML入門
- index.html                        : 目次ページ"
if errorlevel 1 goto error

echo.
echo === git push ===
git push origin main
if errorlevel 1 goto error

echo.
echo === 完了！GitHubへのアップロード成功 ===
pause
exit /b 0

:error
echo.
echo === エラーが発生しました ===
pause
exit /b 1
