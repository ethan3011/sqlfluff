SELECT AI_GENERATE_EMBEDDINGS(N'Hello world' USE MODEL ada_embeddings);

SELECT
    d.id,
    AI_GENERATE_EMBEDDINGS(d.body USE MODEL ada_embeddings) AS embedding
FROM dbo.documents AS d;

DECLARE @options JSON = N'{"dimensions": 768}';
SELECT AI_GENERATE_EMBEDDINGS(title USE MODEL [ada_embeddings] PARAMETERS @options)
FROM dbo.documents;

DECLARE @v VECTOR(1536) = AI_GENERATE_EMBEDDINGS(N'search text' USE MODEL ada_embeddings);

UPDATE dbo.documents
SET embedding = AI_GENERATE_EMBEDDINGS(
    body USE MODEL ada_embeddings
    PARAMETERS TRY_CONVERT(JSON, N'{"dimensions": 768}')
);
