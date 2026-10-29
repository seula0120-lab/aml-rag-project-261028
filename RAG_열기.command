#!/bin/zsh
# 더블클릭 한 번으로: Ollama 켜기 → 모델 확인(없으면 설치) → 화면 서버 켜기 → 브라우저 열기
cd "$(dirname "$0")"
PORT=8011
PAGE="AML_통합_RAG-5_v2.html"
MODELS=("qwen2.5:7b" "bge-m3")
OLLAMA_URL="http://127.0.0.1:11434"

up() { curl -s -m 2 "$OLLAMA_URL/api/tags" >/dev/null; }

echo "1/4 Ollama 확인..."
if ! up; then
  echo "    꺼져 있어서 켭니다."
  open -a Ollama 2>/dev/null || (nohup ollama serve >/dev/null 2>&1 &)
  for i in {1..30}; do up && break; sleep 1; done
fi
up || { echo "Ollama를 켜지 못했습니다. Ollama 앱이 설치돼 있는지 확인하세요."; read -k 1 "?아무 키나 누르면 닫힙니다"; exit 1; }
echo "    Ollama 실행 중"

echo "2/4 모델 확인..."
for m in $MODELS; do
  if ollama list 2>/dev/null | awk 'NR>1{print $1}' | grep -Fxq -e "$m" -e "${m}:latest"; then
    echo "    $m 있음"
  else
    echo "    $m 없음 -> 내려받는 중 (처음 한 번만, 몇 분 걸릴 수 있음)"
    ollama pull "$m" || { echo "$m 설치 실패"; read -k 1 "?아무 키나 누르면 닫힙니다"; exit 1; }
  fi
done

echo "3/4 화면 서버 준비..."
OLD=$(lsof -ti tcp:$PORT 2>/dev/null)
[ -n "$OLD" ] && { echo "    이전 서버($OLD)를 끄고 다시 켭니다."; kill $OLD 2>/dev/null; sleep 1; }

echo "4/4 브라우저 열기 -> http://localhost:$PORT/$PAGE"
[ -z "$NO_OPEN" ] && (sleep 1; open "http://localhost:$PORT/$PAGE") &
echo "끝내려면 이 창을 닫거나 Ctrl+C 를 누르세요."
exec python3 -m http.server $PORT --bind 127.0.0.1
