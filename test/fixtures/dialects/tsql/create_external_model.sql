CREATE EXTERNAL MODEL ada_embeddings
WITH (
    LOCATION = 'https://contoso.openai.azure.com/openai/deployments/ada/embeddings?api-version=2024-02-01',
    API_FORMAT = 'Azure OpenAI',
    MODEL_TYPE = EMBEDDINGS,
    MODEL = 'text-embedding-ada-002',
    CREDENTIAL = [https://contoso.openai.azure.com/]
);

CREATE EXTERNAL MODEL openai_small
AUTHORIZATION app_owner
WITH (
    LOCATION = 'https://api.openai.com/v1/embeddings',
    API_FORMAT = 'OpenAI',
    MODEL_TYPE = EMBEDDINGS,
    MODEL = 'text-embedding-3-small',
    CREDENTIAL = [https://api.openai.com],
    PARAMETERS = '{"dimensions": 512}'
);

CREATE EXTERNAL MODEL local_ollama
WITH (
    MODEL_TYPE = EMBEDDINGS,
    MODEL = 'all-minilm',
    API_FORMAT = 'Ollama',
    LOCATION = 'https://localhost:11435/api/embed'
);

CREATE EXTERNAL MODEL [local onnx]
WITH (
    LOCATION = N'C:\models\all-MiniLM-L6-v2',
    API_FORMAT = 'ONNX Runtime',
    MODEL_TYPE = EMBEDDINGS,
    MODEL = 'allMiniLM',
    LOCAL_RUNTIME_PATH = 'C:\onnx_runtime\'
);
