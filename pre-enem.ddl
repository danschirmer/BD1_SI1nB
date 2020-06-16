---------- CREATE TABLE -------------

CREATE TABLE FILIAIS (
    id_filial  NUMBER NOT NULL PRIMARY KEY,
    cnpj       VARCHAR2(18) UNIQUE NOT NULL,
    email      VARCHAR2(60) UNIQUE NOT NULL,
    telefone   NUMBER(9) UNIQUE NOT NULL,
    local      VARCHAR2(32) NOT NULL
);

CREATE TABLE ADMINISTRATIVOS (
    id_adm            NUMBER NOT NULL PRIMARY KEY,
    nome              VARCHAR2(32) NOT NULL,
    sobrenome         VARCHAR2(32) NOT NULL,
    cpf               VARCHAR2(14) UNIQUE NOT NULL,
    email             VARCHAR2(60) UNIQUE NOT NULL,
    telefone          NUMBER(9) NOT NULL,
    cargo             VARCHAR2(32) NOT NULL,
    salario           NUMBER(6,2) NOT NULL,
    id_filial         NUMBER NOT NULL
);

CREATE TABLE PROFESSORES (
    id_prof     NUMBER NOT NULL PRIMARY KEY,
    nome        VARCHAR2(32) NOT NULL,
    sobrenome   VARCHAR2(32) NOT NULL,
    cpf         VARCHAR2(14) UNIQUE NOT NULL,
    email       VARCHAR2(60) UNIQUE NOT NULL,
    telefone    NUMBER(9) UNIQUE NOT NULL,
    disciplina  VARCHAR2(32) NOT NULL,
    valor_hora  NUMBER(6,2) NOT NULL
);

CREATE TABLE TURMAS (
    id_turma          NUMBER NOT NULL PRIMARY KEY,
    nome              VARCHAR2(32) NOT NULL,
    periodo           VARCHAR2(32) NOT NULL,
    id_filial         NUMBER NOT NULL
);

CREATE TABLE AULAS (
    id_aula            NUMBER NOT NULL PRIMARY KEY,
    tipo               VARCHAR2(32) NOT NULL,
    data               DATE NOT NULL,
    id_turma           NUMBER NOT NULL,
    id_prof            NUMBER NOT NULL
);

CREATE TABLE ALUNOS (
    id_aluno                    NUMBER NOT NULL PRIMARY KEY,
    nome                        VARCHAR2(32) NOT NULL,
    sobrenome                   VARCHAR2(32) NOT NULL,
    email                       VARCHAR2(60) UNIQUE NOT NULL,
    telefone                    NUMBER(9) NOT NULL,
    nome_resp                   VARCHAR2(32) NOT NULL,
    telefone_resp               NUMBER(9) NOT NULL,
    cpf_resp                    VARCHAR2(14) NOT NULL,
    valor_mensalidade           NUMBER(6,2) NOT NULL,
    escola                      VARCHAR2(32) NOT NULL,
    id_turma                    NUMBER NOT NULL    
);  

CREATE TABLE MENSALIDADES (
    id_mensalidade  NUMBER NOT NULL PRIMARY KEY,
    mes             VARCHAR2(14),
    data_pg         DATE NOT NULL,
    id_aluno        NUMBER NOT NULL
);

CREATE TABLE SIMULADOS (
    id_simulado   NUMBER NOT NULL PRIMARY KEY,
    data          DATE UNIQUE NOT NULL,
    qtd_questoes  NUMBER(3) NOT NULL,
    local         VARCHAR2(32) NOT NULL
);

CREATE TABLE ALUNOS_SIMULADOS (
    id_aluno_simulado     NUMBER NOT NULL PRIMARY KEY,
    nota                  NUMBER(6,2) NOT NULL,
    id_aluno              NUMBER NOT NULL,
    id_simulado           NUMBER NOT NULL
);





---------- FOREIGN KEY -------------

ALTER TABLE ADMINISTRATIVOS ADD CONSTRAINT administrativo_filial_fk FOREIGN KEY (id_filial) REFERENCES FILIAIS(id_filial);

ALTER TABLE MENSALIDADES ADD CONSTRAINT mensalidade_aluno_fk FOREIGN KEY (id_aluno) REFERENCES ALUNOS(id_aluno);

ALTER TABLE ALUNOS_SIMULADOS ADD CONSTRAINT aluno_simulado_aluno_fk FOREIGN KEY (id_aluno) REFERENCES ALUNOS(id_aluno);

ALTER TABLE ALUNOS_SIMULADOS ADD CONSTRAINT aluno_simulado_simulado_fk FOREIGN KEY (id_simulado) REFERENCES SIMULADOS(id_simulado);

ALTER TABLE ALUNOS ADD CONSTRAINT aluno_turma_fk FOREIGN KEY (id_turma) REFERENCES TURMAS(id_turma);

ALTER TABLE AULAS ADD CONSTRAINT aula_professor_fk FOREIGN KEY (id_turma) REFERENCES TURMAS(id_turma);

ALTER TABLE AULAS ADD CONSTRAINT professor_aula_fk FOREIGN KEY (id_prof) REFERENCES PROFESSORES(id_prof);

ALTER TABLE TURMAS  ADD CONSTRAINT turma_filial_fk FOREIGN KEY (id_filial) REFERENCES FILIAIS(id_filial);









------------------------------------------------------------- VALUES ---------------------------------------------------------------------------------------

---------- CADASTRO FILIAIS -------------

INSERT INTO FILIAIS (id_filial, cnpj, email, telefone, local) VALUES (001, '00.000.000/0001-01', 'cursopreparatec.cariacica@gmail.com', 33367080, 'Cariacica - ES');

INSERT INTO FILIAIS (id_filial, cnpj, email, telefone, local) VALUES (002, '00.000.000/0001-02', 'cursopreparatec.vilavelha@gmail.com', 30597080, 'Vila Velha - ES');

INSERT INTO FILIAIS (id_filial, cnpj, email, telefone, local) VALUES (003, '00.000.000/0001-03', 'cursopreparatec.serra@gmail.com', 31012121, 'Serra - ES');





-------------------- CADASTRO ADMINISTRATIVOS --------------------

---------- Filial 01 - Cariacica -------------

INSERT INTO ADMINISTRATIVOS (id_adm, nome, sobrenome, cpf, email, telefone, cargo, salario, id_filial) 
                VALUES      (001, 'Lucas', 'Grobério', '111.111.111-00', 'lucas.groberio@gmail,com', 999999999, 'Diretor', 6000.00, 001);

INSERT INTO ADMINISTRATIVOS (id_adm, nome, sobrenome, cpf, email, telefone, cargo, salario, id_filial) 
                VALUES      (002, 'João', 'Pereira', '111.111.111-01', 'joão.pereira@gmail,com', 999999998, 'Cordenador', 5000.00, 001);

INSERT INTO ADMINISTRATIVOS (id_adm, nome, sobrenome, cpf, email, telefone, cargo, salario, id_filial) 
                VALUES      (003, 'José', 'Souza', '111.111.111-02', 'jose.souza@gmail,com', 999999997, 'Supervisor', 4000.00, 001);

INSERT INTO ADMINISTRATIVOS (id_adm, nome, sobrenome, cpf, email, telefone, cargo, salario, id_filial) 
                VALUES      (004, 'Maria', 'Campos', '111.111.111-03', 'maria.campos@gmail,com', 999999996, 'Pedagoga', 3000.00, 001);


---------- Filial 02 - Vila Velha -------------


INSERT INTO ADMINISTRATIVOS (id_adm, nome, sobrenome, cpf, email, telefone, cargo, salario, id_filial)
                VALUES      (005, 'Fernanda', 'Grobério', '111.111.111-05', 'fernanda.groberio@gmail,com', 999999995, 'Diretora', 6000.00, 002);

INSERT INTO ADMINISTRATIVOS (id_adm, nome, sobrenome, cpf, email, telefone, cargo, salario, id_filial) 
                VALUES      (006, 'Pedro', 'Silva', '111.111.111-06', 'pedro.silva@gmail,com', 999999994, 'Cordenador', 5000.00, 002);

INSERT INTO ADMINISTRATIVOS (id_adm, nome, sobrenome, cpf, email, telefone, cargo, salario, id_filial) 
                VALUES      (007, 'Matheus', 'Nunes', '111.111.111-07', 'matheus.nunes@gmail,com', 999999993, 'Supervisor', 4000.00, 002);

INSERT INTO ADMINISTRATIVOS (id_adm, nome, sobrenome, cpf, email, telefone, cargo, salario, id_filial) 
                VALUES      (008, 'Julia', 'Reis', '111.111.111-08', 'julia.reis@gmail,com', 999999992, 'Pedagoga', 3000.00, 002);


---------- Filial 03 - Serra -------------
INSERT INTO ADMINISTRATIVOS (id_adm, nome, sobrenome, cpf, email, telefone, cargo, salario, id_filial)
                VALUES      (009, 'Thiago', 'Batata', '111.111.111-09', 'thiago.batata@gmail,com', 999999991, 'Diretor', 6000.00, 003);

INSERT INTO ADMINISTRATIVOS (id_adm, nome, sobrenome, cpf, email, telefone, cargo, salario, id_filial) 
                VALUES      (010, 'Rafael', 'Nicoli', '111.111.111-10', 'rafael.nicoli@gmail,com', 999999990, 'Cordenador', 5000.00, 003);

INSERT INTO ADMINISTRATIVOS (id_adm, nome, sobrenome, cpf, email, telefone, cargo, salario, id_filial) 
                VALUES      (011, 'Danilo', 'Neto', '111.111.111-11', 'danilo.neto@gmail,com', 999999989, 'Supervisor', 4000.00, 003);

INSERT INTO ADMINISTRATIVOS (id_adm, nome, sobrenome, cpf, email, telefone, cargo, salario, id_filial) 
                VALUES      (012, 'Geovana', 'Damasceno', '111.111.111-12', 'geovana.damasceno@gmail,com', 999999988, 'Pedagoga', 3000.00, 003);




-------------------- CADASTRO PROFESSORES --------------------

INSERT INTO PROFESSORES (id_prof, nome, sobrenome, cpf, email, telefone, disciplina, valor_hora) 
                VALUES  (001,'Maria Odete', 'Marchesi', '222.222.222-00', 'maria.odete@gmail.com', 88888889, 'Algebra', 35.00);

INSERT INTO PROFESSORES (id_prof, nome, sobrenome, cpf, email, telefone, disciplina, valor_hora) 
                VALUES  (002,'Paula', 'Grobério', '222.222.222-01', 'paula.groberio@gmail.com', 88888888, 'Algebra', 35.00);

INSERT INTO PROFESSORES (id_prof, nome, sobrenome, cpf, email, telefone, disciplina, valor_hora) 
                VALUES  (003,'Ildelfonso', 'Grobério', '222.222.222-02', 'Ildelfonso.groberio@gmail.com', 88888887, 'Geometria', 35.00);

INSERT INTO PROFESSORES (id_prof, nome, sobrenome, cpf, email, telefone, disciplina, valor_hora) 
                VALUES  (004,'Fernanda', 'Grobério', '111.111.111-05', 'fernanda.groberio@gmail,com', 999999995, 'Geometria', 35.00);

INSERT INTO PROFESSORES (id_prof, nome, sobrenome, cpf, email, telefone, disciplina, valor_hora) 
                VALUES  (005,'Raquel', 'Madeira', '222.222.222-03', 'raquel.madeira@gmail.com', 88888886, 'Portugûes', 35.00);

INSERT INTO PROFESSORES (id_prof, nome, sobrenome, cpf, email, telefone, disciplina, valor_hora) 
                VALUES  (006,'Vanda', 'Sutil', '222.222.222-04', 'vanda.sutil@gmail.com', 88888885, 'Portugûes', 35.00);

INSERT INTO PROFESSORES (id_prof, nome, sobrenome, cpf, email, telefone, disciplina, valor_hora) 
                VALUES  (007,'Leonardo', 'Tavares', '222.222.222-05', 'Leonardo.tavares@gmail.com', 88888884, 'Quimica', 35.00);

INSERT INTO PROFESSORES (id_prof, nome, sobrenome, cpf, email, telefone, disciplina, valor_hora) 
                VALUES  (008,'Thiago', 'Sandoval', '222.222.222-06', 'thiago.sandoval@gmail.com', 88888883, 'Quimica', 35.00);

INSERT INTO PROFESSORES (id_prof, nome, sobrenome, cpf, email, telefone, disciplina, valor_hora) 
                VALUES  (009,'Paulo', 'Souza', '222.222.222-07', 'paulo.souza@gmail.com', 88888882, 'Física', 35.00);

INSERT INTO PROFESSORES (id_prof, nome, sobrenome, cpf, email, telefone, disciplina, valor_hora) 
                VALUES  (010,'Danilo', 'Pontal', '222.222.222-08', 'danilo.pontal@gmail.com', 88888881, 'Física', 35.00);

INSERT INTO PROFESSORES (id_prof, nome, sobrenome, cpf, email, telefone, disciplina, valor_hora) 
                VALUES  (011,'Daniele', 'Nunes', '222.222.222-09', 'daniele.nunes@gmail.com', 88888880, 'Geografia', 35.00);

INSERT INTO PROFESSORES (id_prof, nome, sobrenome, cpf, email, telefone, disciplina, valor_hora) 
                VALUES  (012,'Ricardo', 'Almeida', '222.222.222-10', 'ricardo.almeida@gmail.com', 88888879, 'Geografia', 35.00);

INSERT INTO PROFESSORES (id_prof, nome, sobrenome, cpf, email, telefone, disciplina, valor_hora) 
                VALUES  (013,'Tarcisio', 'Caliman', '222.222.222-11', 'tarcisio.caliman@gmail.com', 88888878, 'História', 35.00);

INSERT INTO PROFESSORES (id_prof, nome, sobrenome, cpf, email, telefone, disciplina, valor_hora) 
                VALUES  (014,'Carmen', 'Mattos', '222.222.222-12', 'carmem.mattos@gmail.com', 88888877, 'História', 35.00);

INSERT INTO PROFESSORES (id_prof, nome, sobrenome, cpf, email, telefone, disciplina, valor_hora) 
                VALUES  (015,'Daniel', 'Carrareto', '222.222.222-13', 'daniel.carrareto@gmail.com', 88888876, 'Biologia', 35.00);

INSERT INTO PROFESSORES (id_prof, nome, sobrenome, cpf, email, telefone, disciplina, valor_hora) 
                VALUES  (016,'Leandro', 'Guariento', '222.222.222-14', 'leandro.guariento@gmail.com', 88888875, 'Biologia', 35.00);




-------------------- CADASTRO TURMAS --------------------

---------- Filial 01 -------------

-- Matutino

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (001, 'M1', 'Matutino', 001);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (002, 'M2', 'Matutino', 001);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (003, 'M3', 'Matutino', 001);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (004, 'M4', 'Matutino', 001);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (005, 'M5', 'Matutino', 001);


-- Vespertino

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (006, 'V1', 'Vespertino', 001);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (007, 'V2', 'Vespertino', 001);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (008, 'V3', 'Vespertino', 001);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (009, 'V4', 'Vespertino', 001);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (010, 'V5', 'Vespertino', 001);



---------- Filial 02 -------------

-- Matutino

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (011, 'M1', 'Matutino', 002);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (012, 'M2', 'Matutino', 002);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (013, 'M3', 'Matutino', 002);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (014, 'M4', 'Matutino', 002);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (015, 'M5', 'Matutino', 002);


-- Vespertino

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (016, 'V1', 'Vespertino', 002);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (017, 'V2', 'Vespertino', 002);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (018, 'V3', 'Vespertino', 002);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (019, 'V4', 'Vespertino', 002);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (020, 'V5', 'Vespertino', 002);


---------- Filial 03 -------------

-- Matutino

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (021, 'M1', 'Matutino', 003);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (022, 'M2', 'Matutino', 003);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (023, 'M3', 'Matutino', 003);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (024, 'M4', 'Matutino', 003);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (025, 'M5', 'Matutino', 003);


-- Vespertino

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (026, 'V1', 'Vespertino', 003);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (027, 'V2', 'Vespertino', 003);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (028, 'V3', 'Vespertino', 003);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (029, 'V4', 'Vespertino', 003);

INSERT INTO TURMAS (id_turma, nome, periodo, id_filial) VALUES (030, 'V5', 'Vespertino', 003);





-------------------- CADASTRO AULAS --------------------

---------- Filial 01 

----- Turma M1
-- 02/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (001, 'teorica', date '2020-03-02', 001, 001);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (002, 'teorica', date '2020-03-02', 001, 005);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (003, 'teorica', date '2020-03-02', 001, 010);

-- 03/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (004, 'teorica', date '2020-03-03', 001, 002); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (005, 'teorica', date '2020-03-03', 001, 003); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (006, 'teorica', date '2020-03-03', 001, 005);

-- 04/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (007, 'teorica', date '2020-03-04', 001, 007); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (008, 'teorica', date '2020-03-04', 001, 009); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (009, 'teorica', date '2020-03-04', 001, 011);

-- 05/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (010, 'teorica', date '2020-03-05', 001, 013); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (011, 'teorica', date '2020-03-05', 001, 015); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (012, 'teorica', date '2020-03-05', 001, 004);


----- Turma M2
-- 02/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (013, 'teorica', date '2020-03-02', 002, 001);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (014, 'teorica', date '2020-03-02', 002, 005);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (015, 'teorica', date '2020-03-02', 002, 010);

-- 03/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (016, 'teorica', date '2020-03-03', 002, 002); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (017, 'teorica', date '2020-03-03', 002, 003); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (018, 'teorica', date '2020-03-03', 002, 005);

-- 04/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (019, 'teorica', date '2020-03-04', 002, 007); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (020, 'teorica', date '2020-03-04', 002, 009); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (021, 'teorica', date '2020-03-04', 002, 011);

-- 05/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (022, 'teorica', date '2020-03-05', 002, 013); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (023, 'teorica', date '2020-03-05', 002, 015); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (024, 'teorica', date '2020-03-05', 002, 004);



----- Turma V1
-- 02/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (025, 'teorica', date '2020-03-02', 016, 001);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (026, 'teorica', date '2020-03-02', 016, 005);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (027, 'teorica', date '2020-03-02', 016, 010);

-- 03/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (028, 'teorica', date '2020-03-03', 016, 002); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (029, 'teorica', date '2020-03-03', 016, 003); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (030, 'teorica', date '2020-03-03', 016, 005);

-- 04/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (031, 'teorica', date '2020-03-04', 016, 007); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (032, 'teorica', date '2020-03-04', 016, 009); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (033, 'teorica', date '2020-03-04', 016, 011);

-- 05/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (034, 'teorica', date '2020-03-05', 016, 013); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (035, 'teorica', date '2020-03-05', 016, 015); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (036, 'teorica', date '2020-03-05', 016, 004);


----- Turma V2
-- 02/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (037, 'teorica', date '2020-03-02', 017, 001);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (038, 'teorica', date '2020-03-02', 017, 005);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (039, 'teorica', date '2020-03-02', 017, 010);

-- 03/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (040, 'teorica', date '2020-03-03', 017, 002); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (041, 'teorica', date '2020-03-03', 017, 003); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (042, 'teorica', date '2020-03-03', 017, 005);

-- 04/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (043, 'teorica', date '2020-03-04', 017, 007); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (044, 'teorica', date '2020-03-04', 017, 009); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (045, 'teorica', date '2020-03-04', 017, 011);

-- 05/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (046, 'teorica', date '2020-03-05', 017, 013); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (047, 'teorica', date '2020-03-05', 017, 015); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (048, 'teorica', date '2020-03-05', 017, 004);





---------- CADASTRO ALUNOS -------------

----- Turma 01
INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (001, 'Aluno1', 'sobrenome', 'aluno1@gmail.com', 911111111, 'Responsavel', 799999980, '000.000.000-00', 180.00, 'Particular', 001); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (002, 'Aluno2', 'sobrenome', 'aluno2@gmail.com', 911111112, 'Responsavel', 799999981, '000.000.000-01', 180.00, 'Particular', 001); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (003, 'Aluno3', 'sobrenome', 'aluno3@gmail.com', 911111113, 'Responsavel', 799999982, '000.000.000-02', 180.00, 'Particular', 001); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (004, 'Aluno4', 'sobrenome', 'aluno4@gmail.com', 911111114, 'Responsavel', 799999983, '000.000.000-03', 180.00, 'Particular', 001); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (005, 'Aluno5', 'sobrenome', 'aluno5@gmail.com', 911111115, 'Responsavel', 799999984, '000.000.000-04', 180.00, 'Particular', 001); 


----- Turma 02
INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (006, 'Aluno6', 'sobrenome', 'aluno6@gmail.com', 911111116, 'Responsavel', 799999985, '000.000.000-05', 180.00, 'Particular', 002); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (007, 'Aluno7', 'sobrenome', 'aluno7@gmail.com', 911111117, 'Responsavel', 799999986, '000.000.000-06', 180.00, 'Particular', 002); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (008, 'Aluno8', 'sobrenome', 'aluno8@gmail.com', 911111118, 'Responsavel', 799999987, '000.000.000-07', 180.00, 'Particular', 002); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (009, 'Aluno9', 'sobrenome', 'aluno9@gmail.com', 911111119, 'Responsavel', 799999988, '000.000.000-08', 180.00, 'Particular', 002); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (010, 'Aluno10', 'sobrenome', 'aluno10@gmail.com', 911111110, 'Responsavel', 799999989, '000.000.000-09', 180.00, 'Particular', 002); 


----- Turma 03
INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (011, 'Aluno11', 'sobrenome', 'aluno11@gmail.com', 911111120, 'Responsavel', 799999990, '000.000.000-10', 180.00, 'Particular', 003); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (012, 'Aluno12', 'sobrenome', 'aluno12@gmail.com', 911111121, 'Responsavel', 799999991, '000.000.000-11', 180.00, 'Particular', 003); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (013, 'Aluno13', 'sobrenome', 'aluno13@gmail.com', 911111122, 'Responsavel', 799999992, '000.000.000-12', 180.00, 'Particular', 003); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (014, 'Aluno14', 'sobrenome', 'aluno14@gmail.com', 911111123, 'Responsavel', 799999993, '000.000.000-13', 180.00, 'Particular', 003); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (015, 'Aluno15', 'sobrenome', 'aluno15@gmail.com', 911111124, 'Responsavel', 799999994, '000.000.000-14', 180.00, 'Particular', 003); 


----- Turma 04
INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (016, 'Aluno16', 'sobrenome', 'aluno16@gmail.com', 911111125, 'Responsavel', 799999995, '000.000.000-15', 180.00, 'Particular', 004); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (017, 'Aluno17', 'sobrenome', 'aluno17@gmail.com', 911111126, 'Responsavel', 799999996, '000.000.000-16', 180.00, 'Particular', 004); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (018, 'Aluno18', 'sobrenome', 'aluno18@gmail.com', 911111127, 'Responsavel', 799999997, '000.000.000-17', 180.00, 'Particular', 004); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (019, 'Aluno19', 'sobrenome', 'aluno19@gmail.com', 911111128, 'Responsavel', 799999998, '000.000.000-18', 180.00, 'Particular', 004); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (020, 'Aluno20', 'sobrenome', 'aluno20@gmail.com', 911111129, 'Responsavel', 799999999, '000.000.000-19', 180.00, 'Particular', 004); 





---------- CADASTRO MENSALIDADES -------------

----- Aluno 01
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (03, 'Março', date'2020-03-01', 001);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (04, 'Abril', date'2020-04-05', 001);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (05, 'Maio', date'2020-05-02', 001);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (06, 'Junho', date'2020-06-01', 001);

----- Aluno 02
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (07, 'Março', date'2020-03-09', 002);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (08, 'Abril', date'2020-04-05', 002);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (09, 'Maio', date'2020-05-04', 002);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (10, 'Junho', date'2020-06-05', 002);

----- Aluno 03
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (11, 'Março', date'2020-03-05', 003);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (12, 'Abril', date'2020-04-05', 003);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (13, 'Maio', date'2020-05-02', 003);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (14, 'Junho', date'2020-06-03', 003);

----- Aluno 04
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (15, 'Março', date'2020-03-03', 004);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (16, 'Abril', date'2020-04-05', 004);

----- Aluno 05
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (17, 'Março', date'2020-03-01', 005);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (18, 'Abril', date'2020-04-01', 005);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (19, 'Maio', date'2020-05-01', 005);

----- Aluno 06
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (20, 'Março', date'2020-03-01', 006);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (21, 'Abril', date'2020-04-01', 006);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (22, 'Maio', date'2020-05-01', 006);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (23, 'Junho', date'2020-06-01', 006);

----- Aluno 07
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (24, 'Março', date'2020-03-01', 007);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (25, 'Abril', date'2020-04-01', 007);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (26, 'Maio', date'2020-05-01', 007);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (27, 'Junho', date'2020-06-01', 007);

----- Aluno 08
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (28, 'Março', date'2020-03-01', 008);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (29, 'Abril', date'2020-04-01', 008);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (30, 'Maio', date'2020-05-01', 008);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (31, 'Junho', date'2020-06-01', 008);

----- Aluno 09
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (32, 'Março', date'2020-03-01', 009);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (33, 'Abril', date'2020-04-01', 009);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (34, 'Maio', date'2020-05-01', 009);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (35, 'Junho', date'2020-06-01', 009);

----- Aluno 10
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (36, 'Março', date'2020-03-01', 010);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (37, 'Abril', date'2020-04-01', 010);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (38, 'Maio', date'2020-05-01', 010);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (39, 'Junho', date'2020-06-01', 010);

----- Aluno 11
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (40, 'Março', date'2020-03-01', 011);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (41, 'Abril', date'2020-04-01', 011);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (42, 'Maio', date'2020-05-01', 011);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (43, 'Junho', date'2020-06-01', 011);

----- Aluno 12
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (44, 'Março', date'2020-03-01', 012);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (45, 'Abril', date'2020-04-01', 012);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (46, 'Maio', date'2020-05-01', 012);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (47, 'Junho', date'2020-06-01', 012);

----- Aluno 13
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (48, 'Março', date'2020-03-01', 013);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (49, 'Abril', date'2020-04-01', 013);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (50, 'Maio', date'2020-05-01', 013);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (51, 'Junho', date'2020-06-01', 013);

----- Aluno 14
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (52, 'Março', date'2020-03-01', 014);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (53, 'Abril', date'2020-04-01', 014);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (54, 'Maio', date'2020-05-01', 014);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (55, 'Junho', date'2020-06-01', 014);

----- Aluno 15
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (56, 'Março', date'2020-03-01', 015);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (57, 'Abril', date'2020-04-01', 015);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (58, 'Maio', date'2020-05-01', 015);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (59, 'Junho', date'2020-06-01', 015);

----- Aluno 16
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (60, 'Março', date'2020-03-01', 016);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (61, 'Abril', date'2020-04-01', 016);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (62, 'Maio', date'2020-05-01', 016);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (63, 'Junho', date'2020-06-01', 016);

----- Aluno 17
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (64, 'Março', date'2020-03-01', 017);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (65, 'Abril', date'2020-04-01', 017);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (66, 'Maio', date'2020-05-01', 017);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (67, 'Junho', date'2020-06-01', 017);

----- Aluno 18
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (68, 'Março', date'2020-03-01', 018);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (69, 'Abril', date'2020-04-01', 018);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (70, 'Maio', date'2020-05-01', 018);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (71, 'Junho', date'2020-06-01', 018);

----- Aluno 19
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (72, 'Março', date'2020-03-01', 019);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (73, 'Abril', date'2020-04-01', 019);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (74, 'Maio', date'2020-05-01', 019);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (75, 'Junho', date'2020-06-01', 019);

----- Aluno 20
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (76, 'Março', date'2020-03-01', 020);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (77, 'Abril', date'2020-04-01', 020);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (78, 'Maio', date'2020-05-01', 020);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (79, 'Junho', date'2020-06-01', 020);




---------- CADASTRO SIMULADOS -------------

INSERT INTO SIMULADOS (id_simulado, data, qtd_questoes, local) VALUES (001, date'2020-04-15', 60, 'Vitória');
INSERT INTO SIMULADOS (id_simulado, data, qtd_questoes, local) VALUES (002, date'2020-05-15', 60, 'Vila Velha');
INSERT INTO SIMULADOS (id_simulado, data, qtd_questoes, local) VALUES (003, date'2020-06-15', 60, 'Serra');


---------- CADASTRO ALUNOS_SIMULADOS -------------

----- 1ª Simulado
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (001, 47.00, 001, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (002, 40.00, 002, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (003, 33.00, 003, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (004, 50.00, 004, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (005, 58.00, 005, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (006, 35.00, 006, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (007, 33.00, 007, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (008, 49.00, 008, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (009, 54.00, 009, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (010, 49.00, 010, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (011, 25.00, 011, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (012, 47.00, 012, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (013, 21.00, 013, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (014, 28.00, 014, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (015, 37.00, 015, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (016, 48.00, 016, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (017, 38.00, 017, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (018, 54.00, 018, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (019, 57.00, 019, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (020, 60.00, 020, 001);

----- 2ª Simulado
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (021, 60.00, 001, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (022, 57.00, 002, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (023, 54.00, 003, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (024, 38.00, 004, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (025, 55.00, 005, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (026, 40.00, 006, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (027, 40.00, 007, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (028, 38.00, 008, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (029, 50.00, 009, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (030, 00.00, 010, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (031, 47.00, 011, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (032, 47.00, 012, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (033, 00.00, 013, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (034, 28.00, 014, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (035, 00.00, 015, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (036, 48.00, 016, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (037, 00.00, 017, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (038, 54.00, 018, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (039, 57.00, 019, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (040, 56.00, 020, 002);

----- 1ª Simulado
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (041, 53.00, 001, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (042, 42.00, 002, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (043, 44.00, 003, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (044, 55.00, 004, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (045, 56.00, 005, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (046, 40.00, 006, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (047, 38.00, 007, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (048, 56.00, 008, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (049, 55.00, 009, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (050, 45.00, 010, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (051, 36.00, 011, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (052, 48.00, 012, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (053, 47.00, 013, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (054, 48.00, 014, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (055, 43.00, 015, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (056, 43.00, 016, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (057, 55.00, 017, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (058, 58.00, 018, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (059, 53.00, 019, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (060, 50.00, 020, 003);





-------------------- CONSULTAS --------------------

----- Todos os funcionário administrativos da filial 01

select 
        filiais.local, administrativos.nome, administrativos.cargo, administrativos.salario

from 
        Filiais, Administrativos

Where
        filiais.id_filial = administrativos.id_filial
and     filiais.id_filial = 1



----- Todos os funcionário administrativos que também são professores
select 
         administrativos.nome, administrativos.sobrenome, administrativos.cargo, administrativos.salario, filiais.local, professores.disciplina, professores.valor_hora

from 
        Filiais, Administrativos, professores

Where
        filiais.id_filial = administrativos.id_filial
    and administrativos.cpf = professores.cpf
