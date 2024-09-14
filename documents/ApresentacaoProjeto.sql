CREATE TABLE TELEFONE (
    telefone CHAR(11) NOT NULL,
    CONSTRAINT PK_TELEFONE PRIMARY KEY(telefone)
);

CREATE TABLE CLIENTE (
    nome VARCHAR(40),
    CPF CHAR(11),
    telefone CHAR(11),
    rua VARCHAR(40),
    bairro VARCHAR(40),
    numero VARCHAR(40),
    cidade VARCHAR(40),
    estado VARCHAR(40),
    cep CHAR(8),
	constraint PK_CLIENTE PRIMARY KEY(CPF),
	constraint FK_telefone_cliente foreign key(telefone) references TELEFONE(telefone) 
);

CREATE TABLE ENGENHEIRO_CIVIL (
    CREA CHAR(10) NOT NULL,
    nome VARCHAR(40),
	especialidade VARCHAR(50),
	salario numeric(10,2),
	chefe CHAR(10),
	constraint PK_Eengenheiro primary key (CREA),
	constraint FK_CHEFE FOREIGN KEY (chefe) REFERENCES ENGENHEIRO_CIVIL(CREA)
);

CREATE TABLE PROJETO (
	codProjeto SERIAL,
    bairro VARCHAR(40),
    cidade VARCHAR(40),
    estado VARCHAR(40),
    numero INTEGER,
    rua VARCHAR(40),
    cep CHAR(8),
    status VARCHAR(40),
	descricao VARCHAR(40),
	CPF_cliente CHAR (11) NOT NULL,
	CREA_eng CHAR(10) NOT NULL,
    constraint PK_PROJETO PRIMARY KEY(codProjeto),
	constraint FK_CLIENTE FOREIGN KEY(CPF_cliente) REFERENCES CLIENTE(CPF),
	constraint FK_ENGENHEIRO FOREIGN KEY(CREA_eng) REFERENCES ENGENHEIRO_CIVIL(CREA)
);

CREATE TABLE PLANEJAMENTO (
	codPlanejamento SERIAL NOT NULL,
	autor_projeto CHAR(10),
	projeto INTEGER,
	orcamento NUMERIC(18,2),
	codProjeto SERIAL,
	data_inicio DATE,
    data_fim DATE,
	constraint PK_planejamento primary key (codPlanejamento),
	constraint FK_engenheiro_crea foreign key(autor_projeto) references ENGENHEIRO_CIVIL(CREA),
	constraint FK_projeot_codProj foreign key(projeto) references PROJETO(codProjeto)
);

CREATE TABLE FORNECEDOR (
    CNPJ CHAR(14) NOT NULL,
    nome VARCHAR(40),
    rua VARCHAR(40),
    numero INTEGER,
    bairro VARCHAR(40),
    cidade VARCHAR(40),
    estado VARCHAR(40),
    cep CHAR(8),
	constraint PK_CNPJ PRIMARY KEY(CNPJ)
);

CREATE TABLE MATERIAL (
	codMaterial SERIAL NOT NULL,
    descricao VARCHAR(40),
    estoque INTEGER DEFAULT 0,
	CNPJ_for CHAR(14) NOT NULL,
	constraint PK_material primary key (codMaterial),
	constraint FK_fornecedor FOREIGN KEY (CNPJ_for) REFERENCES FORNECEDOR(CNPJ)
);

CREATE TABLE REQUER (
    codRequisicao SERIAL,
	planejamento INTEGER NOT NULL,
	material_solicitado INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
	constraint PK_requisicao primary key (codRequisicao),
	constraint FK_planejamento FOREIGN KEY (planejamento) REFERENCES PLANEJAMENTO(codPlanejamento),
	constraint FK_material FOREIGN KEY (material_solicitado) REFERENCES MATERIAL(codMaterial)
);

-- Inserindo nas tabelas 

-- Inserir dados na tabela CLIENTE
INSERT INTO telefone (telefone) VALUES ('11987654321'),
										('11987654322'),
										('11987654323'),
										('11987654324'),
										('11987654325'),
										('11987654326'),
										('11987654327'),
										('11987654328'),
										('11987654329'),
										('11987654330');
-- Inserindo telefone de Clientes da Paraíba										
INSERT INTO telefone (telefone) VALUES('83987654321'),
									   ('83987654322'),
									   ('83987654323'),
									   ('83987654324'),
									   ('83987654325'),
									   ('83987654326'),
									   ('83987654327'),
									   ('83987654328'),
									   ('83987654329'),
									   ('83987654330');


INSERT INTO CLIENTE (nome, CPF, telefone, rua, bairro, numero, cidade, estado, cep) VALUES 
('Carlos Silva', '12345678901', '11987654321', 'Rua das Flores', 'Jardim Botânico', '10', 'São Paulo', 'SP', '01234567'),
('Ana Costa', '23456789012', '11987654322', 'Avenida Paulista', 'Centro', '123', 'São Paulo', 'SP', '01345678'),
('Pedro Almeida', '34567890123', '11987654323', 'Rua dos Três Irmãos', 'Vila Mariana', '45', 'São Paulo', 'SP', '01456789'),
('Mariana Lima', '45678901234', '11987654324', 'Rua da Consolação', 'Consolação', '78', 'São Paulo', 'SP', '01567890'),
('João Pereira', '56789012345', '11987654325', 'Rua das Palmeiras', 'Vila Olímpia', '12', 'São Paulo', 'SP', '01678901'),
('Luana Santos', '67890123456', '11987654326', 'Rua do Riachuelo', 'Liberdade', '34', 'São Paulo', 'SP', '01789012'),
('Felipe Oliveira', '78901234567', '11987654327', 'Avenida Ipiranga', 'República', '56', 'São Paulo', 'SP', '01890123'),
('Tatiane Martins', '89012345678', '11987654328', 'Rua dos Anjos', 'Higienópolis', '89', 'São Paulo', 'SP', '01901234'),
('Gustavo Rocha', '90123456789', '11987654329', 'Rua do Comércio', 'Bom Retiro', '90', 'São Paulo', 'SP', '02012345'),
('Juliana Ferreira', '01234567890', '11987654330', 'Rua das Oliveiras', 'Santa Cecília', '67', 'São Paulo', 'SP', '02123456');

-- Inserindo Clientes da Paraíba										
INSERT INTO CLIENTE (nome, CPF, telefone, rua, bairro, numero, cidade, estado, cep) VALUES 
('João Batista', '12345678909', '83987654321', 'Rua das Flores', 'Centro', '10', 'João Pessoa', 'PB', '58010000'),
('Maria Oliveira', '23456789010', '83987654322', 'Avenida Epitácio Pessoa', 'Tambaú', '123', 'João Pessoa', 'PB', '58039000'),
('José Pereira', '34567890121', '83987654323', 'Rua das Trincheiras', 'Jaguaribe', '45', 'João Pessoa', 'PB', '58015000'),
('Cláudia Santos', '45678901232', '83987654324', 'Rua Almeida Barreto', 'Torre', '78', 'João Pessoa', 'PB', '58040000'),
('Ricardo Nascimento', '56789012343', '83987654325', 'Rua das Acácias', 'Miramar', '12', 'João Pessoa', 'PB', '58032000'),
('Fernanda Lima', '67890123454', '83987654326', 'Avenida Cabo Branco', 'Cabo Branco', '34', 'João Pessoa', 'PB', '58045000'),
('Gabriel Souza', '78901234565', '83987654327', 'Rua Rodrigues de Aquino', 'Varadouro', '56', 'João Pessoa', 'PB', '58010000'),
('Patrícia Almeida', '89012345676', '83987654328', 'Rua Aluízio França', 'Tambauzinho', '89', 'João Pessoa', 'PB', '58042000'),
('Carlos Monteiro', '90123456787', '83987654329', 'Rua Coronel Juvino Cavalcanti', 'Manaíra', '90', 'João Pessoa', 'PB', '58038000'),
('Beatriz Rocha', '01234567898', '83987654330', 'Avenida Senador Ruy Carneiro', 'Brisamar', '67', 'João Pessoa', 'PB', '58039000');


-- Inserir dados na tabela ENGENHEIRO_CIVIL
INSERT INTO ENGENHEIRO_CIVIL (CREA, nome, especialidade, salario, chefe)
VALUES 
('1234567890', 'Ana Souza', 'Estruturas',20000.00, NULL),    
('2345678901', 'Pedro Lima', 'Geotecnia',12000.00, '1234567890'), 
('3456789012', 'Mariana Costa', 'Hidráulica',8000.00,'1234567890'), 
('4567890123', 'Carlos Almeida', 'Construção',18000.00, NULL),  
('5678901234', 'Julia Mendes', 'Infraestrutura',10000.00,'4567890123'), 
('6789012345', 'Roberto Lima', 'Estruturas',18000.00 , NULL),    
('7890123456', 'Laura Fernandes', 'Geotecnia',9000.00, '6789012345'), 
('8901234567', 'Fábio Pereira', 'Hidráulica',18000.00, NULL),  
('9012345678', 'Letícia Rocha', 'Construção',6000.00,'8901234567'), 
('0123456789', 'Eduardo Silva', 'Infraestrutura',7000.00,NULL);

-- Inserir dados na tabela PROJETO
INSERT INTO PROJETO (bairro, cidade, estado, numero, rua, cep, status, descricao,CPF_cliente, CREA_eng) VALUES 
('Jardim Botânico', 'São Paulo', 'SP', 101, 'Rua das Flores', '01234567', 'Em Andamento', 'Construção de parque urbano','12345678901','1234567890'),
('Centro', 'São Paulo', 'SP', 202, 'Avenida Paulista', '01345678', 'Concluído', 'Reforma de prédio histórico','23456789012','4567890123'),
('Vila Mariana', 'São Paulo', 'SP', 303, 'Rua dos Três Irmãos', '01456789', 'Em Planejamento', 'Novo centro cultural','34567890123','2345678901'),
('Consolação', 'São Paulo', 'SP', 404, 'Rua da Consolação', '01567890', 'Em Andamento', 'Construção de shopping center','45678901234','6789012345'),
('Vila Olímpia', 'São Paulo', 'SP', 505, 'Rua das Palmeiras', '01678901', 'Concluído', 'Edificação de escritório','56789012345','0123456789'),
('Liberdade', 'São Paulo', 'SP', 606, 'Rua do Riachuelo', '01789012', 'Em Andamento', 'Renovação de bairro','67890123456','2345678901'),
('República', 'São Paulo', 'SP', 707, 'Avenida Ipiranga', '01890123', 'Concluído', 'Construção de hotel','78901234567','9012345678'),
('Higienópolis', 'São Paulo', 'SP', 808, 'Rua dos Anjos', '01901234', 'Em Planejamento', 'Desenvolvimento de campus universitário','78901234567','8901234567'),
('Bom Retiro', 'São Paulo', 'SP', 909, 'Rua do Comércio', '02012345', 'Em Andamento', 'Reforma de área comercial','89012345678','5678901234'),
('Santa Cecília', 'São Paulo', 'SP', 1010, 'Rua das Oliveiras', '02123456', 'Concluído', 'Construção de residencial','01234567890','1234567890');

-- Inserir dados na tabela PLANEJAMENTO
INSERT INTO PLANEJAMENTO (autor_projeto, projeto, orcamento, codProjeto, data_inicio, data_fim)
VALUES 
('1234567890', 1, 50000.00, DEFAULT, '2024-01-15', '2024-06-15'),   
('2345678901', 2, 75000.00, DEFAULT, '2024-02-01', '2024-07-01'), 
('3456789012', 3, 120000.00, DEFAULT, '2024-03-10', '2024-08-10'), 
('4567890123', 4, 30000.00, DEFAULT, '2024-04-05', '2024-09-05'),  
('5678901234', 5, 95000.00, DEFAULT, '2024-05-20', '2024-10-20'), 
('6789012345', 6, 60000.00, DEFAULT, '2024-06-15', '2024-11-15'), 
('7890123456', 7, 110000.00, DEFAULT, '2024-07-01', '2024-12-01'),  
('8901234567', 8, 70000.00, DEFAULT, '2024-08-10', '2025-01-10'),  
('9012345678', 9, 40000.00, DEFAULT, '2024-09-05', '2025-02-05'),   
('0123456789', 10, 80000.00,DEFAULT, '2024-10-15', '2025-03-15'); 

-- Inserindo em fornecedor

INSERT INTO FORNECEDOR (CNPJ, nome, rua, numero, bairro, cidade, estado, cep) VALUES
    ('12345678000101', 'Construtora ABC', 'Rua das Palmeiras', 100, 'Centro', 'São Paulo', 'SP', '01001000'),
    ('98765432000155', 'Materiais Silva', 'Av. Brasil', 200, 'Jardim América', 'Rio de Janeiro', 'RJ', '20040000'),
    ('54321678000144', 'Brita Forte', 'Rua das Pedras', 300, 'Industrial', 'Belo Horizonte', 'MG', '30120000'),
    ('67890543000166', 'Areia & Cia', 'Rua dos Coqueiros', 400, 'São José', 'Porto Alegre', 'RS', '90050000'),
    ('32109876000199', 'Tijolos Constrular', 'Av. dos Estados', 500, 'Centro', 'Recife', 'PE', '50010000'),
    ('45678901000111', 'Bloco Master', 'Rua do Concreto', 600, 'Indústrias', 'Curitiba', 'PR', '80060000'),
    ('78901234000122', 'Telhas Nova', 'Rua da Cobertura', 700, 'Residencial', 'Florianópolis', 'SC', '88030000'),
    ('65432198000177', 'Argamassa Rápida', 'Rua do Revestimento', 800, 'Boa Vista', 'Manaus', 'AM', '69020000'),
    ('89012345000188', 'Tubos Flex', 'Av. das Águas', 900, 'Praia Grande', 'Fortaleza', 'CE', '60060000'),
    ('23456789000133', 'Estruturas Ferro Forte', 'Rua do Aço', 1000, 'Centro', 'Salvador', 'BA', '40030000');

-- Inserindo dentro de materiais 
INSERT INTO MATERIAL (descricao, estoque, CNPJ_for) VALUES
    ('Cimento Portland', 500, '12345678000101'),
    ('Aço CA-50', 300, '98765432000155'),
    ('Brita 1', 1000, '54321678000144'),
    ('Areia Média', 800, '67890543000166'),
    ('Tijolo 6 Furos', 2000, '32109876000199'),
    ('Bloco de Concreto', 1500, '45678901000111'),
    ('Telha de Fibrocimento', 700, '78901234000122'),
    ('Argamassa ACIII', 350, '65432198000177'),
    ('Tubos de PVC', 600, '89012345000188'),
    ('Ferro para Estrutura', 250, '23456789000133');

-- Inserindo dentro de requisicao
-- Assumindo que os códigos de planejamento e de material já existem
INSERT INTO REQUER (planejamento, material_solicitado, quantidade) VALUES
    (1, 1, 50),  -- Planejamento 1, Material 1 (Cimento Portland)
    (1, 2, 100), -- Planejamento 1, Material 2 (Aço CA-50)
    (2, 3, 200), -- Planejamento 2, Material 3 (Brita 1)
    (2, 4, 150), -- Planejamento 2, Material 4 (Areia Média)
    (3, 5, 500), -- Planejamento 3, Material 5 (Tijolo 6 Furos)
    (3, 6, 300), -- Planejamento 3, Material 6 (Bloco de Concreto)
    (4, 7, 100), -- Planejamento 4, Material 7 (Telha de Fibrocimento)
    (4, 8, 250), -- Planejamento 4, Material 8 (Argamassa ACIII)
    (5, 9, 400), -- Planejamento 5, Material 9 (Tubos de PVC)
    (5, 10, 120);-- Planejamento 5, Material 10 (Ferro para Estrutura)


-- Visão 
-- Uma view que retorna a relação Engenheiro, projeto e planejamento, para obter com clareza qual o projeto, o planejamento e qual engenheiro é responsável.
CREATE OR REPLACE VIEW Relatorio AS
SELECT
E.nome AS nome_engenheiro,
E.CREA,
P.descricao AS nome_projeto,
Plan.data_inicio AS Inicio_projeto
FROM
ENGENHEIRO_CIVIL E
JOIN
PROJETO P ON E.CREA = P.CREA_eng
JOIN
PLANEJAMENTO Plan ON P.codprojeto = Plan.codplanejamento;

-- Função
-- Uma função que retorna nome dos engenheiros com base nas especializações solicitadas para um determinado projeto.

CREATE OR REPLACE FUNCTION mostra_engenheiros_por_especializacao(v_especializacao IN ENGENHEIRO_CIVIL.especialidade%TYPE) 
RETURNS VOID 
AS $$ 
DECLARE 
v_engenheiros_cursor CURSOR 
FOR SELECT nome 
FROM ENGENHEIRO_CIVIL 
WHERE especialidade = v_especializacao; 
v_engenheiro RECORD; 
BEGIN 
FOR v_engenheiro IN v_engenheiros_cursor LOOP 
RAISE NOTICE 'Nome do engenheiro: %', v_engenheiro.nome; 
END LOOP; 
END; 

-- Trigger (o mais interessante) 
-- Adicionar o Trigger para proteger a exclusão de um engenheiro que está vinculado a um projeto em fase de execução.

CREATE OR REPLACE FUNCTION fn_proteger_exclusao_engenheiro()
RETURNS TRIGGER AS $$
BEGIN
IF EXISTS (
SELECT 1
FROM PROJETO p
JOIN ENGENHEIRO_CIVIL e 
ON p.CREA_eng = e.CREA
WHERE e.CREA = OLD.CREA
AND p.status IN ('Em Andamento', 'Em Planejamento')  
) THEN
RAISE EXCEPTION 'Não é possível excluir o engenheiro % pois ele está vinculado a um projeto em fase de execução.', OLD.CREA;
END IF;
RETURN OLD;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_proteger_exclusao_engenheiro
BEFORE DELETE ON ENGENHEIRO_CIVIL
FOR EACH ROW
EXECUTE FUNCTION fn_proteger_exclusao_engenheiro();
