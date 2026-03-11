DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    ativo CHAR(1) NOT NULL DEFAULT 'S',
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuarios (nome, email, senha, ativo)
VALUES
    ('Martinho Numa', 'numaprofissional@gmail.ao', 'numa1234', 'S'),
    ('Alcino Numa', 'alcinonuma@gmail.ao', 'numa1234', 'N');

--

SELECT
    id,
    nome,
    email,
    CASE
        WHEN ativo = 'S' THEN 'LOGIN LIBERADO'
        ELSE 'USUARIO INATIVO'
    END AS status_login
FROM usuarios
WHERE email = 'numaprofissional@gmai.ao'
  AND senha = 'numa1234';

-- em caso de falha
SELECT
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM usuarios
            WHERE email = 'numaprofissional@gmai.ao'
              AND senha = 'numa1234'
              AND ativo = 'S'
        ) THEN 'Bem-vindo ao sistema'
        ELSE 'Email ou senha invalidos'
    END AS resultado_login;