# example-openroute

Exemplo mínimo de como chamar a API do [OpenRouter](https://openrouter.ai) a partir de um script Shell usando `curl`. O script envia um prompt a um modelo gratuito (`nvidia/nemotron-3-nano-omni-30b-a3b-reasoning:free`) e exibe a resposta no terminal.

## Requisitos

- Linux, macOS ou WSL
- `bash` e `curl`
- (Opcional) `jq` para formatar a resposta
- Uma chave de API do OpenRouter

## Configuração

1. Clone o repositório:

```bash
   git clone https://github.com/glaudistonneto/example-openroute.git
   cd example-openroute
```

2. Crie o arquivo `.env` a partir do exemplo e adicione sua chave:

```bash
   cp .env.example .env
```

```
   OPENROUTER_API_KEY=sua_chave_aqui
```

   > O `.env` está no `.gitignore` e nunca deve ser commitado.

## Uso

```bash
bash request.sh
```

Para exibir apenas o texto da resposta:

```bash
bash request.sh | jq -r '.choices[0].message.content'
```

## Parâmetros do script

| Variável | Descrição |
|---|---|
| `API_URL` | Endpoint de chat completions do OpenRouter |
| `NLP_MODEL` | Modelo utilizado na requisição |
| `OPENROUTER_SITE_URL` | Enviado no header `HTTP-Referer` |
| `OPENROUTER_SITE_NAME` | Enviado no header `X-Title` |

No corpo da requisição, `temperature` controla a variação das respostas e `max_tokens` limita o tamanho da saída.

## Observações

- Modelos de raciocínio consomem tokens no "pensamento" interno. Se a resposta vier cortada ou vazia, aumente o `max_tokens`.
- Modelos gratuitos podem ter limite de requisições e variar de disponibilidade. Confira a lista atual em [openrouter.ai/models](https://openrouter.ai/models).

## Licença

MIT
