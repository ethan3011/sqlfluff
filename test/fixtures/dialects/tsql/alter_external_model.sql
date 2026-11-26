ALTER EXTERNAL MODEL ada_embeddings
SET (MODEL = 'text-embedding-3-large');

ALTER EXTERNAL MODEL ada_embeddings
SET (
    LOCATION = 'https://contoso.openai.azure.com/openai/deployments/large/embeddings?api-version=2024-02-01',
    CREDENTIAL = [https://contoso.openai.azure.com/],
    PARAMETERS = '{"dimensions": 1024}'
);
