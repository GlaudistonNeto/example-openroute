source .env

API_URL="https://openrouter.ai/api/v1/chat/completions"
OPENROUTER_SITE_URL="http://localhost:3000"
OPENROUTER_SITE_NAME="My OpenRouter"

NLP_MODEL="nvidia/nemotron-3-nano-omni-30b-a3b-reasoning:free"

curl --silent -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${OPENROUTER_API_KEY}" \
  -H "HTTP-Referer: ${OPENROUTER_SITE_URL}" \
  -H "X-Title: ${OPENROUTER_SITE_NAME}" \
  -d '{
    "model": "'"${NLP_MODEL}"'",
    "messages": [
      {
        "role": "user",
        "content": "Conte-me uma curiosidade sobre LLMs"
      }
    ],
    "temperature": 0.3,
    "max_tokens": 1000
  }'