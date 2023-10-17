// Integrantes:
// Guilherme Cardoso Barreiro - 94726
// Gabriel Arbigaus Carvalho de Souza - 93372
// Henrique Copatti Cruz - 94751
// Nicolas Estrella Porciuncula - 94236
// Pedro de Pimentel Teixeira Silva - 95166

// ----------------------------------- PARTE 1 -----------------------------------

// Selects
-- Tarefa 1: Carga inicial de dados

-- Inserir pelo menos 3 registros em cada tabela. Cada uma dentro de uma transação.

-- Transação 1
BEGIN
  INSERT INTO status_produto (id_status, ds_status)
  VALUES (1, 'Produto Disponível');

  INSERT INTO status_produto (id_status, ds_status)
  VALUES (2, 'Produto Em Falta');

  INSERT INTO status_produto (id_status, ds_status)
  VALUES (3, 'Produto Encomendado');
END;

-- Transação 2
BEGIN
  INSERT INTO unidade_produto (id_unidade, ds_produto)
  VALUES (1, 'Muito bom para descer ladeiras');

  INSERT INTO unidade_produto (id_unidade, ds_produto)
  VALUES (2, 'Remédio para dores de cabeça e febre');

  INSERT INTO unidade_produto (id_unidade, ds_produto)
  VALUES (3, 'Boa proteção contra a chuva');
END;

-- Transação 3
BEGIN
  INSERT INTO fornecedor (id_fornecedor, nm_fornecedor)
  VALUES (1, 'Alberto');

  INSERT INTO fornecedor (id_fornecedor, nm_fornecedor)
  VALUES (2, 'Ana Maria Braga');
END;

-- Transação 4
BEGIN
  INSERT INTO cliente(id_cliente, nm_cliente, email, cep, tp_cliente, complemento)
  VALUES (1, 'Gui', 'guicbarreiro@gmail.com', 1010170, 'Pessoa Física', 'Apto 34 Bloco D');

  INSERT INTO cliente(id_cliente, nm_cliente, email, cep, tp_cliente, complemento)
  VALUES (2, 'Nick', 'nickeporciuncula@gmail.com', 2010170, 'Pessoa Jurídica', 'Apto 21 Bloco A');

  INSERT INTO cliente(id_cliente, nm_cliente, email, cep, tp_cliente, complemento)
  VALUES (3, 'Gabriel', 'gabrielacarvalho@gmail.com', 3010170, 'Pessoa Física', 'Apto 12 Bloco C');
END;

-- Transação 5
BEGIN
  INSERT INTO cliente_pj (id_cliente_pj, cnpj, id_cliente)
  VALUES (1, 72537491072536, 2);

  INSERT INTO cliente_pj (id_cliente_pj, cnpj, id_cliente)
  VALUES (2, 38294036749517, 5);
END;

-- Transação 6
BEGIN
  INSERT INTO reserva (id_reserva, dt_reserva, dt_retirada, id_cliente_pj)
  VALUES (1, '2023-03-14', '2023-04-27', 2);

  INSERT INTO reserva (id_reserva, dt_reserva, dt_retirada, id_cliente_pj)
  VALUES (2, '2023-07-04', '2023-08-18', 1);
END;

-- Transação 7
BEGIN
  INSERT INTO cliente_pf (id_cliente_pf, cpf, dt_nascimento, id_cliente)
  VALUES (1, 59901397057, '2002-03-23', 1);

  INSERT INTO cliente_pf (id_cliente_pf, cpf, dt_nascimento, id_cliente)
  VALUES (2, 20262920000, '2006-05-17', 3);

  INSERT INTO cliente_pf (id_cliente_pf, cpf, dt_nascimento, id_cliente)
  VALUES (3, 88662891055, '2009-10-05', 4);
END;

-- Transação 8
BEGIN
  INSERT INTO devolucao (id_devolucao, dt_devolucao, id_cliente_pf)
  VALUES (1, '2023-10-04', 5);

  INSERT INTO devolucao (id_devolucao, dt_devolucao, id_cliente_pf)
  VALUES (2, '2023-09-30', 1);
END;

-- Transação 9
BEGIN
  INSERT INTO loja (id_loja, nm_loja, nr_telefone)
  VALUES (1, 'Lojas Americanas', 11937849281);

  INSERT INTO loja (id_loja, nm_loja, nr_telefone)
  VALUES (2, 'Drogaria São Paulo', 11945489655);
END;

-- Transação 10
BEGIN
  INSERT INTO vendedor (id_vendedor, nm_vendedor, dt_emissao, dt_demissao, id_venda_aprov_item)
  VALUES (1, 'Carlos', '2016-03-31', null, 1);

  INSERT INTO vendedor (id_vendedor, nm_vendedor, dt_emissao, dt_demissao, id_venda_aprov_item)
  VALUES (2, 'Jaqueline', '2020-07-09', null, 1);
END;

-- Transação 11
BEGIN
  INSERT INTO venda (id_venda, dt_venda, id_cliente, id_vendedor, id_loja)
  VALUES (1, '2023-09-22', 4, 1, 1);

  INSERT INTO venda (id_venda, dt_venda, id_cliente, id_vendedor, id_loja)
  VALUES (2, '2023-09-29', 1, 3, 3);
END;

-- Transação 12
BEGIN
  INSERT INTO produto (id_produto, nm_produto, vl_unitario, id_unidade, id_status)
  VALUES (1, 'Carrinho de Rolimã', 150.00, 1, 3);

  INSERT INTO produto (id_produto, nm_produto, vl_unitario, id_unidade, id_status)
  VALUES (2, 'Paracetamol', 8.50, 2, 1);

  INSERT INTO produto (id_produto, nm_produto, vl_unitario, id_unidade, id_status)
  VALUES (3, 'Capa de chuva', 28.00, 3, 1);
END;

-- Transação 13
BEGIN
  INSERT INTO fornecedor_produto (id_produto, id_fornecedor)
  VALUES (1, 1);

  INSERT INTO fornecedor_produto (id_produto, id_fornecedor)
  VALUES (2, 2);
END;

-- Transação 14
BEGIN
  INSERT INTO estoque_produto (id_loja, id_produto, qtd_estoque)
  VALUES (1, 1, 5);

  INSERT INTO estoque_produto (id_loja, id_produto, qtd_estoque)
  VALUES (2, 2, 35);
END;

-- Transação 15
BEGIN
  INSERT INTO itens_venda (id_venda, id_produto, qtd, vl_unit_venda, id_vendedor)
  VALUES (1, 1, 1, 150.00, 1);

  INSERT



// ---------------------------------------------------------------------------------

// IGNORAR O QUE ESTIVER AQUI PARA BAIXO (APENAS SERVE PARA CONSULTA DE LÓGICA E TABELA)

// ---------------------------------------------------------------------------------



DROP TABLE cliente CASCADE CONSTRAINTS PURGE;
CREATE TABLE cliente (
    id_cliente  NUMBER(10)   NOT NULL,
    nm_cliente  VARCHAR2(60) NOT NULL,
    email       VARCHAR2(60) NOT NULL,
    cep         NUMBER(8)    NOT NULL,
    tp_cliente  VARCHAR2(60) NOT NULL,
    complemento VARCHAR2(60),
    CONSTRAINT  cl_pk        PRIMARY KEY(id_cliente),
    CONSTRAINT  cl_email_uk  UNIQUE (email)
);

DROP TABLE cliente_pj CASCADE CONSTRAINTS PURGE;
CREATE TABLE cliente_pj (
    id_cliente_pj  NUMBER(10)         NOT NULL,
    cnpj           NUMBER(14)         NOT NULL,
    id_cliente     NUMBER(10)         NOT NULL,
    CONSTRAINT     clpj_pk            PRIMARY KEY(id_cliente_pj),
    CONSTRAINT     clpj_cliente_id_fk FOREIGN KEY(id_cliente) REFERENCES cliente
);
CREATE INDEX   pj_cliente_idx     ON cliente_pj(id_cliente);
CREATE INDEX   pj_cnpj_idx        ON cliente_pj(cnpj);

DROP TABLE cliente_pf CASCADE CONSTRAINTS PURGE;
CREATE TABLE cliente_pf (
    id_cliente_pf  NUMBER(10)         NOT NULL,
    cpf            NUMBER(11),
    dt_nascimento  DATE,
    id_cliente     NUMBER(10)         NOT NULL,
    CONSTRAINT     clpf_pk            PRIMARY KEY(id_cliente_pf),
    CONSTRAINT     clpf_cliente_id_fk FOREIGN KEY(id_cliente) REFERENCES cliente,
    CONSTRAINT     clpf_cpf_uk        UNIQUE(cpf)
);
CREATE INDEX   pf_cliente_idx     ON cliente_pf(id_cliente);

DROP TABLE venda CASCADE CONSTRAINTS PURGE;
CREATE TABLE venda (
    id_venda      NUMBER(10)             NOT NULL,
    dt_venda      DATE                   NOT NULL,
    id_cliente    NUMBER(10)             NOT NULL,
    id_vendedor   NUMBER(10)             NOT NULL,
    id_loja       NUMBER(10)             NOT NULL,
    CONSTRAINT    venda_pk               PRIMARY KEY(id_venda),
    CONSTRAINT    venda_cliente_id_fk    FOREIGN KEY(id_cliente)  REFERENCES cliente,
    CONSTRAINT    venda_vendedor_fk      FOREIGN KEY(id_vendedor) REFERENCES vendedor,
    CONSTRAINT    venda_loja_fk          FOREIGN KEY(id_loja)     REFERENCES loja
);
CREATE INDEX  venda_data_cliente_idx ON venda(dt_venda, id_cliente);

DROP TABLE vendedor CASCADE CONSTRAINTS PURGE;
CREATE TABLE vendedor (
    id_vendedor    NUMBER(10)                  NOT NULL,
    nm_vendedor    VARCHAR2(50)                NOT NULL,
    dt_emissao     DATE,
    dt_demissao    DATE,
    id_venda_aprov_item                        NUMBER(10),
    CONSTRAINT     vendedor_pk                 PRIMARY KEY(id_vendedor),
    CONSTRAINT     vendedor_idvendaprovitem_fk FOREIGN KEY(id_venda_aprov_item)  REFERENCES vendedor
);

DROP TABLE loja CASCADE CONSTRAINTS PURGE;
CREATE TABLE loja (
    id_loja     NUMBER(10)   NOT NULL,
    nm_loja     VARCHAR2(50) NOT NULL,
    nr_telefone NUMBER(11),
    CONSTRAINT  loja_pk      PRIMARY KEY(id_loja)
);

DROP TABLE itens_venda CASCADE CONSTRAINTS PURGE;
CREATE TABLE itens_venda (
    id_venda      NUMBER(10)              NOT NULL,
    id_produto    NUMBER(10)              NOT NULL,
    qtd           NUMBER(10),
    vl_unit_venda NUMBER(10, 2),
    id_vendedor   NUMBER(10),
    CONSTRAINT    itens_venda_pk          PRIMARY KEY(id_venda, id_produto),
    CONSTRAINT    itens_venda_venda_fk    FOREIGN KEY(id_venda)    REFERENCES venda,
    CONSTRAINT    itens_venda_produto_fk  FOREIGN KEY(id_produto)  REFERENCES produto,
    CONSTRAINT    itens_venda_vendedor_fk FOREIGN KEY(id_vendedor) REFERENCES vendedor
);

DROP TABLE devolucao CASCADE CONSTRAINTS PURGE;
CREATE TABLE devolucao (
    id_devolucao  NUMBER(10)       NOT NULL,
    dt_devolucao  DATE             DEFAULT SYSDATE
                                   NOT NULL,
    id_cliente_pf NUMBER(10)       NOT NULL,
    CONSTRAINT    dev_pk           PRIMARY KEY(id_devolucao),
    CONSTRAINT    dev_clientepf_fk FOREIGN KEY(id_cliente_pf) REFERENCES cliente_pf
);

DROP TABLE reserva CASCADE CONSTRAINTS PURGE;
CREATE TABLE reserva (
    id_reserva    NUMBER(10)       NOT NULL,
    dt_reserva    DATE             DEFAULT SYSDATE
                                   NOT NULL,
    dt_retirada   DATE             NOT NULL,
    id_cliente_pj NUMBER(10)       NOT NULL,
    CONSTRAINT    res_pk           PRIMARY KEY(id_reserva),
    CONSTRAINT    res_clientepj_fk FOREIGN KEY(id_cliente_pj) REFERENCES cliente_pj
);

DROP TABLE reserva_produtos CASCADE CONSTRAINTS PURGE;
CREATE TABLE reserva_produtos(
    id_reserva NUMBER(10) NOT NULL,
    id_produto NUMBER(10) NOT NULL,
    qtd        NUMBER(10) NOT NULL,
    CONSTRAINT res_prod_pk      PRIMARY KEY (id_reserva, id_produto),
    CONSTRAINT res_prod_res_fk  FOREIGN KEY (id_reserva) REFERENCES reserva,
    CONSTRAINT res_prod_prod_fk FOREIGN KEY (id_produto) REFERENCES produto
);

DROP TABLE devolucao_produtos CASCADE CONSTRAINTS PURGE;
CREATE TABLE devolucao_produtos (
    id_venda      NUMBER(10)        NOT NULL,
    id_produto    NUMBER(10)        NOT NULL,
    id_devolucao  NUMBER(10)        NOT NULL,
    qtd           NUMBER(10)        NOT NULL,
    CONSTRAINT    dev_prod_pk       PRIMARY KEY(id_venda, id_produto, id_devolucao),
    CONSTRAINT    dev_prod_venda_fk FOREIGN KEY(id_venda, id_produto) REFERENCES itens_venda,
    CONSTRAINT    dev_prod_dev_fk   FOREIGN KEY(id_devolucao)         REFERENCES devolucao
);

DROP TABLE estoque_produto CASCADE CONSTRAINTS PURGE;
CREATE TABLE estoque_produto (
    id_loja       NUMBER(10)      NOT NULL,
    id_produto    NUMBER(10)      NOT NULL,
    qtd_estoque   NUMBER(10)      NOT NULL,
    CONSTRAINT    es_prod_pk      PRIMARY KEY(id_loja, id_produto),
    CONSTRAINT    es_prod_loja_fk FOREIGN KEY(id_loja)    REFERENCES loja,
    CONSTRAINT    es_prod_fk      FOREIGN KEY(id_produto) REFERENCES produto
);

DROP TABLE produto CASCADE CONSTRAINTS PURGE;
CREATE TABLE produto (
    id_produto    NUMBER(10)          NOT NULL,
    nm_produto    VARCHAR2(60)        NOT NULL,
    vl_unitario   NUMBER(10, 2)       NOT NULL,
    id_unidade    NUMBER(10)          NOT NULL,
    id_status     NUMBER(10)          NOT NULL,
    CONSTRAINT    prod_pk             PRIMARY KEY(id_produto),
    CONSTRAINT    prod_uni_prod_fk    FOREIGN KEY(id_unidade) REFERENCES unidade_produto,
    CONSTRAINT    prod_status_prod_fk FOREIGN KEY(id_status)  REFERENCES status_produto
);
CREATE INDEX  produto_nome_idx    ON produto(nm_produto);
CREATE INDEX  produto_valor_idx   ON produto(vl_unitario);

DROP TABLE unidade_produto CASCADE CONSTRAINTS PURGE;
CREATE TABLE unidade_produto (
    id_unidade   NUMBER(10)   NOT NULL,
    ds_produto   VARCHAR2(60),
    CONSTRAINT   unidade_pk   PRIMARY KEY(id_unidade)
);

DROP TABLE status_produto CASCADE CONSTRAINTS PURGE;
CREATE TABLE status_produto (
    id_status   NUMBER(10)   NOT NULL,
    ds_status   VARCHAR2(60),
    CONSTRAINT  status_pk    PRIMARY KEY(id_status)
);

DROP TABLE fornecedor_produto CASCADE CONSTRAINTS PURGE;
CREATE TABLE fornecedor_produto (
    id_produto    NUMBER(10)         NOT NULL,
    id_fornecedor NUMBER(10)         NOT NULL,
    CONSTRAINT    forn_prod_pk       PRIMARY KEY(id_produto, id_fornecedor),
    CONSTRAINT    forn_prod_fk       FOREIGN KEY(id_produto)    REFERENCES produto,
    CONSTRAINT    forn_prod_forn_fk  FOREIGN KEY(id_fornecedor) REFERENCES fornecedor
);

DROP TABLE fornecedor CASCADE CONSTRAINTS PURGE;
CREATE TABLE fornecedor (
    id_fornecedor  NUMBER(10)    NOT NULL,
    nm_fornecedor VARCHAR2(60),
    CONSTRAINT    fornecedor_pk PRIMARY KEY(id_fornecedor)
);

ALTER TABLE cliente ADD comentario    VARCHAR2(255);
ALTER TABLE cliente MODIFY comentario VARCHAR2(300);
ALTER TABLE cliente DROP COLUMN comentario;
