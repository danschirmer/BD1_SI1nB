---------- DROP TABLE -------------

DROP TABLE ALUNOS_SIMULADOS;
DROP TABLE SIMULADOS;
DROP TABLE MENSALIDADES;
DROP TABLE ALUNOS;
DROP TABLE AULAS;
DROP TABLE TURMAS;
DROP TABLE PROFESSORES;
DROP TABLE ADMINISTRATIVOS;
DROP TABLE FILIAIS;


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
    salario           NUMBER(8,2) NOT NULL,
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
    valor_hora  NUMBER(8,2) NOT NULL
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
    valor_mensalidade           NUMBER(8,2) NOT NULL,
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

---------- Filial 01 (turmas 01 até 10)

----- Turma M1

-- 02/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (001, 'teorica', TO_DATE('02/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 001, 001);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (002, 'teorica', TO_DATE('02/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 001, 005);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (003, 'teorica', TO_DATE('02/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 001, 010);

-- 03/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (004, 'teorica', TO_DATE('03/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 001, 002); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (005, 'teorica', TO_DATE('03/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 001, 003); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (006, 'teorica', TO_DATE('03/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 001, 005);

-- 04/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (007, 'teorica', TO_DATE('04/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 001, 007); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (008, 'teorica', TO_DATE('04/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 001, 009); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (009, 'teorica', TO_DATE('04/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 001, 011);

-- 05/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (010, 'teorica', TO_DATE('05/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 001, 013); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (011, 'teorica', TO_DATE('05/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 001, 015); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (012, 'teorica', TO_DATE('05/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 001, 004);

----- Turma M2

-- 02/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (013, 'teorica', TO_DATE('02/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 002, 001);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (014, 'teorica', TO_DATE('02/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 002, 005);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (015, 'teorica', TO_DATE('02/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 002, 010);

-- 03/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (016, 'teorica', TO_DATE('03/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 002, 002); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (017, 'teorica', TO_DATE('03/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 002, 003); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (018, 'teorica', TO_DATE('03/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 002, 005);

-- 04/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (019, 'teorica', TO_DATE('04/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 002, 007); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (020, 'teorica', TO_DATE('04/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 002, 009); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (021, 'teorica', TO_DATE('04/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 002, 011);

-- 05/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (022, 'teorica', TO_DATE('05/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 002, 013); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (023, 'teorica', TO_DATE('05/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 002, 015); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (024, 'teorica', TO_DATE('05/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 002, 004);

----- Turma V1

-- 02/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (025, 'teorica', TO_DATE('02/03/2020 13:30:00', 'DD/MM/YYYY HH24:MI:SS'), 006, 001);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (026, 'teorica', TO_DATE('02/03/2020 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 006, 005);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (027, 'teorica', TO_DATE('02/03/2020 15:30:00', 'DD/MM/YYYY HH24:MI:SS'), 006, 010);

-- 03/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (028, 'teorica', TO_DATE('03/03/2020 13:30:00', 'DD/MM/YYYY HH24:MI:SS'), 006, 002); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (029, 'teorica', TO_DATE('03/03/2020 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 006, 003); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (030, 'teorica', TO_DATE('03/03/2020 15:30:00', 'DD/MM/YYYY HH24:MI:SS'), 006, 005);

-- 04/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (031, 'teorica', TO_DATE('04/03/2020 13:30:00', 'DD/MM/YYYY HH24:MI:SS'), 006, 007); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (032, 'teorica', TO_DATE('04/03/2020 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 006, 009); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (033, 'teorica', TO_DATE('04/03/2020 15:30:00', 'DD/MM/YYYY HH24:MI:SS'), 006, 011);

-- 05/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (034, 'teorica', TO_DATE('05/03/2020 13:30:00', 'DD/MM/YYYY HH24:MI:SS'), 006, 013); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (035, 'teorica', TO_DATE('05/03/2020 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 006, 015); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (036, 'teorica', TO_DATE('05/03/2020 15:30:00', 'DD/MM/YYYY HH24:MI:SS'), 006, 004);

----- Turma V2

-- 02/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (037, 'teorica', TO_DATE('02/03/2020 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 007, 001);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (038, 'teorica', TO_DATE('02/03/2020 15:30:00', 'DD/MM/YYYY HH24:MI:SS'), 007, 005);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (039, 'teorica', TO_DATE('02/03/2020 13:30:00', 'DD/MM/YYYY HH24:MI:SS'), 007, 010);

-- 03/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (040, 'teorica', TO_DATE('03/03/2020 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 007, 002); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (041, 'teorica', TO_DATE('03/03/2020 15:30:00', 'DD/MM/YYYY HH24:MI:SS'), 007, 003); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (042, 'teorica', TO_DATE('03/03/2020 13:30:00', 'DD/MM/YYYY HH24:MI:SS'), 007, 005);

-- 04/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (043, 'teorica', TO_DATE('04/03/2020 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 007, 007); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (044, 'teorica', TO_DATE('04/03/2020 15:30:00', 'DD/MM/YYYY HH24:MI:SS'), 007, 009); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (045, 'teorica', TO_DATE('04/03/2020 13:30:00', 'DD/MM/YYYY HH24:MI:SS'), 007, 011);

-- 05/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (046, 'teorica', TO_DATE('05/03/2020 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 007, 013); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (047, 'teorica', TO_DATE('05/03/2020 15:30:00', 'DD/MM/YYYY HH24:MI:SS'), 007, 015); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (048, 'teorica', TO_DATE('05/03/2020 13:30:00', 'DD/MM/YYYY HH24:MI:SS'), 007, 004);

---------- Filial 02 (turmas 11 até 20)

----- Turma M1

-- 09/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (049, 'teorica', TO_DATE('09/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 011, 001);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (050, 'teorica', TO_DATE('09/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 011, 005);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (051, 'teorica', TO_DATE('09/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 011, 010);

-- 10/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (052, 'teorica', TO_DATE('10/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 011, 002); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (053, 'teorica', TO_DATE('10/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 011, 003); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (054, 'teorica', TO_DATE('10/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 011, 005);

-- 11/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (055, 'teorica', TO_DATE('11/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 011, 007); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (056, 'teorica', TO_DATE('11/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 011, 009); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (057, 'teorica', TO_DATE('11/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 011, 011);

-- 12/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (058, 'teorica', TO_DATE('12/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 011, 013); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (059, 'teorica', TO_DATE('12/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 011, 015); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (060, 'teorica', TO_DATE('12/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 011, 004);

----- Turma M2

-- 09/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (061, 'teorica', TO_DATE('09/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 012, 001);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (062, 'teorica', TO_DATE('09/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 012, 005);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (063, 'teorica', TO_DATE('09/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 012, 010);

-- 10/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (064, 'teorica', TO_DATE('10/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 012, 002); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (065, 'teorica', TO_DATE('10/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 012, 003); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (066, 'teorica', TO_DATE('10/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 012, 005);

-- 11/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (067, 'teorica', TO_DATE('11/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 012, 007); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (068, 'teorica', TO_DATE('11/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 012, 009); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (069, 'teorica', TO_DATE('11/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 012, 011);

-- 12/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (070, 'teorica', TO_DATE('12/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 012, 013); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (071, 'teorica', TO_DATE('12/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 012, 015); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (072, 'teorica', TO_DATE('12/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 012, 004);

----- Turma V1

-- 09/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (073, 'teorica', TO_DATE('09/03/2020 13:30:00', 'DD/MM/YYYY HH24:MI:SS'), 013, 001);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (074, 'teorica', TO_DATE('09/03/2020 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 013, 005);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (075, 'teorica', TO_DATE('09/03/2020 15:30:00', 'DD/MM/YYYY HH24:MI:SS'), 013, 010);

-- 10/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (076, 'teorica', TO_DATE('10/03/2020 13:30:00', 'DD/MM/YYYY HH24:MI:SS'), 013, 002); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (077, 'teorica', TO_DATE('10/03/2020 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 013, 003); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (078, 'teorica', TO_DATE('10/03/2020 15:30:00', 'DD/MM/YYYY HH24:MI:SS'), 013, 005);

-- 11/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (079, 'teorica', TO_DATE('11/03/2020 13:30:00', 'DD/MM/YYYY HH24:MI:SS'), 013, 007); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (080, 'teorica', TO_DATE('11/03/2020 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 013, 009); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (081, 'teorica', TO_DATE('11/03/2020 15:30:00', 'DD/MM/YYYY HH24:MI:SS'), 013, 011);

-- 12/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (082, 'teorica', TO_DATE('12/03/2020 13:30:00', 'DD/MM/YYYY HH24:MI:SS'), 013, 013); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (083, 'teorica', TO_DATE('12/03/2020 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 013, 015); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (084, 'teorica', TO_DATE('12/03/2020 15:30:00', 'DD/MM/YYYY HH24:MI:SS'), 013, 004);

----- Turma V2

-- 09/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (085, 'teorica', TO_DATE('09/03/2020 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 014, 001);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (086, 'teorica', TO_DATE('09/03/2020 15:30:00', 'DD/MM/YYYY HH24:MI:SS'), 014, 005);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (087, 'teorica', TO_DATE('09/03/2020 13:30:00', 'DD/MM/YYYY HH24:MI:SS'), 014, 010);

-- 10/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (088, 'teorica', TO_DATE('10/03/2020 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 014, 002); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (089, 'teorica', TO_DATE('10/03/2020 15:30:00', 'DD/MM/YYYY HH24:MI:SS'), 014, 003); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (090, 'teorica', TO_DATE('10/03/2020 13:30:00', 'DD/MM/YYYY HH24:MI:SS'), 014, 005);

-- 11/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (091, 'teorica', TO_DATE('11/03/2020 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 014, 007); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (092, 'teorica', TO_DATE('11/03/2020 15:30:00', 'DD/MM/YYYY HH24:MI:SS'), 014, 009); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (093, 'teorica', TO_DATE('11/03/2020 13:30:00', 'DD/MM/YYYY HH24:MI:SS'), 014, 011);

-- 12/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (094, 'teorica', TO_DATE('12/03/2020 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 014, 013); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (095, 'teorica', TO_DATE('12/03/2020 15:30:00', 'DD/MM/YYYY HH24:MI:SS'), 014, 015); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (096, 'Revisão', TO_DATE('12/03/2020 13:30:00', 'DD/MM/YYYY HH24:MI:SS'), 014, 004);

---------- Filial 03 (turmas 21 até 30)

----- Turma M1

-- 13/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (097, 'teorica', TO_DATE('13/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 021, 001);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (098, 'teorica', TO_DATE('13/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 021, 005);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (099, 'teorica', TO_DATE('13/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 021, 004);

-- 16/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (100, 'teorica', TO_DATE('16/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 021, 002); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (101, 'teorica', TO_DATE('16/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 021, 003); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (102, 'teorica', TO_DATE('16/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 021, 005);

-- 17/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (103, 'teorica', TO_DATE('17/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 021, 007); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (104, 'teorica', TO_DATE('17/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 021, 009); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (105, 'teorica', TO_DATE('17/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 021, 011);

-- 18/03/2020
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (106, 'teorica', TO_DATE('18/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 021, 013); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (107, 'teorica', TO_DATE('18/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 021, 015); 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (108, 'teorica', TO_DATE('18/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 021, 004);

---------- AULAS DE EXERCICIOS 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (109, 'exercicios', TO_DATE('27/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 011, 004);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (110, 'exercicios', TO_DATE('27/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 011, 005);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (111, 'exercicios', TO_DATE('27/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 011, 012);

---------- AULAS DE REVISÃO 
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (112, 'revisão', TO_DATE('14/03/2020 07:30:00', 'DD/MM/YYYY HH24:MI:SS'), 011, 004);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (113, 'revisão', TO_DATE('14/03/2020 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), 011, 005);
INSERT INTO AULAS (id_aula, tipo, data, id_turma, id_prof) VALUES (114, 'revisão', TO_DATE('14/03/2020 09:30:00', 'DD/MM/YYYY HH24:MI:SS'), 011, 012);


---------- CADASTRO ALUNOS -------------

-- FILIAL 01 - Cariacica

----- Turma 01
INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (001, 'Aluno1', 'sobrenome', 'aluno1@gmail.com', 911111111, 'Responsavel', 799999980, '000.000.000-00', 180.00, 'Particular', 001); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (002, 'Aluno2', 'sobrenome', 'aluno2@gmail.com', 911111112, 'Responsavel', 799999981, '000.000.000-01', 180.00, 'Particular', 001); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (003, 'Aluno3', 'sobrenome', 'aluno3@gmail.com', 911111113, 'Responsavel', 799999982, '000.000.000-02', 150.00, 'Pública', 001); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (004, 'Aluno4', 'sobrenome', 'aluno4@gmail.com', 911111114, 'Responsavel', 799999983, '000.000.000-03', 150.00, 'Pública', 001); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (005, 'Aluno5', 'sobrenome', 'aluno5@gmail.com', 911111115, 'Responsavel', 799999984, '000.000.000-04', 150.00, 'Pública', 001); 

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
            VALUES (011, 'Aluno11', 'sobrenome', 'aluno11@gmail.com', 911111120, 'Responsavel', 799999990, '000.000.000-10', 150.00, 'Pública', 003); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (012, 'Aluno12', 'sobrenome', 'aluno12@gmail.com', 911111121, 'Responsavel', 799999991, '000.000.000-11', 150.00, 'Pública', 003); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (013, 'Aluno13', 'sobrenome', 'aluno13@gmail.com', 911111122, 'Responsavel', 799999992, '000.000.000-12', 150.00, 'Pública', 003); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (014, 'Aluno14', 'sobrenome', 'aluno14@gmail.com', 911111123, 'Responsavel', 799999993, '000.000.000-13', 180.00, 'Particular', 003); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (015, 'Aluno15', 'sobrenome', 'aluno15@gmail.com', 911111124, 'Responsavel', 799999994, '000.000.000-14', 180.00, 'Particular', 003); 

----- Turma 04
INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (016, 'Aluno16', 'sobrenome', 'aluno16@gmail.com', 911111125, 'Responsavel', 799999995, '000.000.000-15', 180.00, 'Particular', 004); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (017, 'Aluno17', 'sobrenome', 'aluno17@gmail.com', 911111126, 'Responsavel', 799999996, '000.000.000-16', 150.00, 'Pública', 004); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (018, 'Aluno18', 'sobrenome', 'aluno18@gmail.com', 911111127, 'Responsavel', 799999997, '000.000.000-17', 180.00, 'Particular', 004); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (019, 'Aluno19', 'sobrenome', 'aluno19@gmail.com', 911111128, 'Responsavel', 799999998, '000.000.000-18', 180.00, 'Particular', 004); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (020, 'Aluno20', 'sobrenome', 'aluno20@gmail.com', 911111129, 'Responsavel', 799999999, '000.000.000-19', 180.00, 'Pública', 004); 

-- FILIAL 02 - Vila Velha

----- Turma 01
INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (021, 'Aluno21', 'sobrenome', 'aluno21@gmail.com', 911111131, 'Responsavel', 799999180, '000.000.000-20', 180.00, 'Particular', 006); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (022, 'Aluno22', 'sobrenome', 'aluno22@gmail.com', 911111132, 'Responsavel', 799999181, '000.000.000-21', 180.00, 'Particular', 006); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (023, 'Aluno23', 'sobrenome', 'aluno23@gmail.com', 911111133, 'Responsavel', 799999182, '000.000.000-22', 150.00, 'Pública', 006); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (024, 'Aluno24', 'sobrenome', 'aluno24@gmail.com', 911111134, 'Responsavel', 799999183, '000.000.000-23', 150.00, 'Pública', 006); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (025, 'Aluno25', 'sobrenome', 'aluno25@gmail.com', 911111135, 'Responsavel', 799999184, '000.000.000-24', 150.00, 'Pública', 006); 

----- Turma 02
INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (026, 'Aluno26', 'sobrenome', 'aluno26@gmail.com', 911111136, 'Responsavel', 799999185, '000.000.000-25', 180.00, 'Particular', 007); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (027, 'Aluno27', 'sobrenome', 'aluno27@gmail.com', 911111137, 'Responsavel', 799999186, '000.000.000-26', 180.00, 'Particular', 007); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (028, 'Aluno28', 'sobrenome', 'aluno28@gmail.com', 911111138, 'Responsavel', 799999187, '000.000.000-27', 180.00, 'Particular', 007); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (029, 'Aluno29', 'sobrenome', 'aluno29@gmail.com', 911111139, 'Responsavel', 799999188, '000.000.000-28', 180.00, 'Particular', 007); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (030, 'Aluno30', 'sobrenome', 'aluno30@gmail.com', 911111130, 'Responsavel', 799999189, '000.000.000-29', 180.00, 'Particular', 007); 

----- Turma 03
INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (031, 'Aluno31', 'sobrenome', 'aluno31@gmail.com', 911111140, 'Responsavel', 799999190, '000.000.000-30', 150.00, 'Pública', 011); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (032, 'Aluno32', 'sobrenome', 'aluno32@gmail.com', 911111141, 'Responsavel', 799999191, '000.000.000-31', 150.00, 'Pública', 011); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (033, 'Aluno33', 'sobrenome', 'aluno33@gmail.com', 911111142, 'Responsavel', 799999192, '000.000.000-32', 150.00, 'Pública', 011); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (034, 'Aluno34', 'sobrenome', 'aluno34@gmail.com', 911111143, 'Responsavel', 799999193, '000.000.000-33', 180.00, 'Particular', 011); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (035, 'Aluno35', 'sobrenome', 'aluno35@gmail.com', 911111144, 'Responsavel', 799999194, '000.000.000-34', 180.00, 'Particular', 011); 

----- Turma 04
INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (036, 'Aluno36', 'sobrenome', 'aluno36@gmail.com', 911111145, 'Responsavel', 799999195, '000.000.000-35', 180.00, 'Particular', 012); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (037, 'Aluno37', 'sobrenome', 'aluno37@gmail.com', 911111146, 'Responsavel', 799999196, '000.000.000-36', 150.00, 'Pública', 012); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (038, 'Aluno38', 'sobrenome', 'aluno38@gmail.com', 911111147, 'Responsavel', 799999197, '000.000.000-37', 180.00, 'Particular', 012); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (039, 'Aluno39', 'sobrenome', 'aluno39@gmail.com', 911111148, 'Responsavel', 799999198, '000.000.000-38', 180.00, 'Particular', 012); 

INSERT INTO ALUNOS (id_aluno, nome, sobrenome, email, telefone, nome_resp, telefone_resp, cpf_resp, valor_mensalidade, escola, id_turma) 
            VALUES (040, 'Aluno40', 'sobrenome', 'aluno40@gmail.com', 911111149, 'Responsavel', 799999199, '000.000.000-39', 180.00, 'Pública', 012);


---------- CADASTRO MENSALIDADES -------------

----- Aluno 01
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (03, 'Março', date'2020-03-01', 001);
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

----- Aluno 21
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (80, 'Março', date'2020-03-01', 021);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (81, 'Junho', date'2020-06-01', 021);

----- Aluno 22
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (82, 'Março', date'2020-03-09', 022);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (83, 'Abril', date'2020-04-05', 022);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (84, 'Maio', date'2020-05-04', 022);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (85, 'Junho', date'2020-06-05', 022);

----- Aluno 23
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (86, 'Março', date'2020-03-05', 023);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (87, 'Abril', date'2020-04-05', 023);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (88, 'Maio', date'2020-05-02', 023);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (89, 'Junho', date'2020-06-03', 023);

----- Aluno 24
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (90, 'Março', date'2020-03-03', 024);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (91, 'Abril', date'2020-04-05', 024);

----- Aluno 25
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (92, 'Março', date'2020-03-01', 025);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (93, 'Abril', date'2020-04-01', 025);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (94, 'Maio', date'2020-05-01', 025);

----- Aluno 26
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (95, 'Março', date'2020-03-01', 026);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (96, 'Abril', date'2020-04-01', 026);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (97, 'Maio', date'2020-05-01', 026);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (98, 'Junho', date'2020-06-01', 026);

----- Aluno 27
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (99, 'Abril', date'2020-04-01', 027);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (100, 'Maio', date'2020-05-01', 027);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (101, 'Junho', date'2020-06-01', 027);

----- Aluno 28
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (102, 'Março', date'2020-03-01', 028);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (103, 'Abril', date'2020-04-01', 028);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (104, 'Maio', date'2020-05-01', 028);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (105, 'Junho', date'2020-06-01', 028);

----- Aluno 29
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (106, 'Março', date'2020-03-01', 029);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (107, 'Abril', date'2020-04-01', 029);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (108, 'Maio', date'2020-05-01', 029);

----- Aluno 30
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (109, 'Março', date'2020-03-01', 030);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (110, 'Abril', date'2020-04-01', 030);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (111, 'Maio', date'2020-05-01', 030);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (112, 'Junho', date'2020-06-01', 030);

----- Aluno 31
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (113, 'Março', date'2020-03-01', 031);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (114, 'Abril', date'2020-04-01', 031);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (115, 'Maio', date'2020-05-01', 031);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (116, 'Junho', date'2020-06-01', 031);

----- Aluno 32
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (117, 'Março', date'2020-03-01', 032);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (118, 'Maio', date'2020-05-01', 032);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (119, 'Junho', date'2020-06-01', 032);

----- Aluno 33
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (120, 'Março', date'2020-03-01', 033);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (121, 'Abril', date'2020-04-01', 033);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (122, 'Maio', date'2020-05-01', 033);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (123, 'Junho', date'2020-06-01', 033);

----- Aluno 34
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (124, 'Março', date'2020-03-01', 034);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (125, 'Abril', date'2020-04-01', 034);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (126, 'Maio', date'2020-05-01', 034);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (127, 'Junho', date'2020-06-01', 034);

----- Aluno 35
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (128, 'Março', date'2020-03-01', 035);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (129, 'Maio', date'2020-05-01', 035);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (130, 'Junho', date'2020-06-01', 035);

----- Aluno 36
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (131, 'Março', date'2020-03-01', 036);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (132, 'Abril', date'2020-04-01', 036);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (133, 'Maio', date'2020-05-01', 036);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (134, 'Junho', date'2020-06-01', 036);

----- Aluno 37
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (135, 'Março', date'2020-03-01', 037);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (136, 'Abril', date'2020-04-01', 037);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (137, 'Maio', date'2020-05-01', 037);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (138, 'Junho', date'2020-06-01', 037);

----- Aluno 38
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (139, 'Março', date'2020-03-01', 038);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (140, 'Abril', date'2020-04-01', 038);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (141, 'Maio', date'2020-05-01', 038);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (142, 'Junho', date'2020-06-01', 038);

----- Aluno 39
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (143, 'Março', date'2020-03-01', 039);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (144, 'Abril', date'2020-04-01', 039);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (145, 'Maio', date'2020-05-01', 039);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (146, 'Junho', date'2020-06-01', 039);

----- Aluno 40
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (147, 'Março', date'2020-03-01', 040);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (148, 'Abril', date'2020-04-01', 040);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (149, 'Maio', date'2020-05-01', 040);
INSERT INTO MENSALIDADES (id_mensalidade, mes, data_pg, id_aluno) VALUES (150, 'Junho', date'2020-06-01', 040);


---------- CADASTRO SIMULADOS -------------

INSERT INTO SIMULADOS (id_simulado, data, qtd_questoes, local) VALUES (001, date'2020-04-11', 60, 'Vitória');
INSERT INTO SIMULADOS (id_simulado, data, qtd_questoes, local) VALUES (002, date'2020-05-16', 60, 'Vila Velha');
INSERT INTO SIMULADOS (id_simulado, data, qtd_questoes, local) VALUES (003, date'2020-06-20', 60, 'Serra');


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
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (021, 47.00, 021, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (022, 40.00, 022, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (023, 33.00, 023, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (024, 50.00, 024, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (025, 58.00, 025, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (026, 35.00, 026, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (027, 33.00, 027, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (028, 49.00, 028, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (029, 54.00, 029, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (030, 49.00, 030, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (031, 25.00, 031, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (032, 47.00, 032, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (033, 21.00, 033, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (034, 28.00, 034, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (035, 37.00, 035, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (036, 48.00, 036, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (037, 38.00, 037, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (038, 54.00, 038, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (039, 57.00, 039, 001);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (040, 60.00, 040, 001);

----- 2ª Simulado
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (041, 60.00, 001, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (042, 57.00, 002, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (043, 54.00, 003, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (044, 38.00, 004, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (045, 55.00, 005, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (046, 40.00, 006, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (047, 40.00, 007, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (048, 38.00, 008, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (049, 50.00, 009, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (050, 00.00, 010, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (051, 47.00, 011, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (052, 47.00, 012, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (053, 00.00, 013, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (054, 28.00, 014, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (055, 00.00, 015, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (056, 48.00, 016, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (057, 00.00, 017, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (058, 54.00, 018, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (059, 57.00, 019, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (060, 56.00, 020, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (061, 43.00, 021, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (062, 41.00, 022, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (063, 37.00, 023, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (064, 48.00, 024, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (065, 55.00, 025, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (066, 43.00, 026, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (067, 37.00, 027, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (068, 54.00, 028, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (069, 57.00, 029, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (070, 49.00, 030, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (071, 32.00, 031, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (072, 56.00, 032, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (073, 30.00, 033, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (074, 35.00, 034, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (075, 39.00, 035, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (076, 45.00, 036, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (077, 55.00, 037, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (078, 55.00, 038, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (079, 56.00, 039, 002);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (080, 58.00, 040, 002);

----- 3ª Simulado
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (081, 53.00, 001, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (082, 42.00, 002, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (083, 44.00, 003, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (084, 55.00, 004, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (085, 56.00, 005, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (086, 40.00, 006, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (087, 38.00, 007, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (088, 56.00, 008, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (089, 55.00, 009, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (090, 45.00, 010, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (091, 36.00, 011, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (092, 48.00, 012, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (093, 47.00, 013, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (094, 48.00, 014, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (095, 43.00, 015, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (096, 43.00, 016, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (097, 55.00, 017, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (098, 58.00, 018, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (099, 53.00, 019, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (100, 50.00, 020, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (101, 45.00, 021, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (102, 44.00, 022, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (103, 42.00, 023, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (104, 50.00, 024, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (105, 53.00, 025, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (106, 48.00, 026, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (107, 35.00, 027, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (108, 49.00, 028, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (109, 55.00, 029, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (110, 43.00, 030, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (111, 38.00, 031, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (112, 54.00, 032, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (113, 38.00, 033, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (114, 37.00, 034, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (115, 45.00, 035, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (116, 47.00, 036, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (117, 54.00, 037, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (118, 52.00, 038, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (119, 56.00, 039, 003);
INSERT INTO ALUNOS_SIMULADOS (id_aluno_simulado, nota, id_aluno, id_simulado) VALUES (120, 58.00, 040, 003);









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



----- Quantas aulas um determinado professor ministrou

select 
        professores.nome, professores.sobrenome, professores.disciplina, professores.valor_hora, aulas.tipo, TO_CHAR(aulas.data, 'DD/MM/YYYY HH24:MI:SS') as DATA_HORA, turmas.nome, filiais.local
        
from
        professores, aulas, turmas, filiais
        
where
        professores.id_prof = aulas.id_prof        
and     turmas.id_turma = aulas.id_turma
and     filiais.id_filial = turmas.id_filial
and     professores.id_prof = 004

order by aulas.data



----- Alunos que pagaram o mês de Março

select 
        alunos.nome, alunos.valor_mensalidade, mensalidades.mes, mensalidades.data_pg 
        
from
        alunos, mensalidades
        
where
        alunos.id_aluno = mensalidades.id_aluno
and     mensalidades.mes = 'Março'

order by alunos.valor_mensalidade



----- Saber se um determinado aluno pagou as mensalidades

select
        alunos.nome, alunos.valor_mensalidade, mensalidades.mes, mensalidades.data_pg

from
        ALUNOS, MENSALIDADES

where
        alunos.id_aluno = mensalidades.id_aluno
and     alunos.id_aluno = 1



----- Qual a nota de um determinado aluno em um determinado simulado

select
        simulados.data as data_simulado, simulados.local as local_simulado, simulados.qtd_questoes, alunos.nome, turmas.nome as turma, filiais.local as filial , alunos_simulados.nota as nota_aluno, alunos.escola
        
from 
        simulados, alunos, alunos_simulados, filiais, turmas

where
        alunos.id_turma = turmas.id_turma
and     turmas.id_filial = filiais.id_filial
and     alunos.id_aluno = alunos_simulados.id_aluno
and     simulados.id_simulado = alunos_simulados.id_simulado
and     alunos.id_aluno = 1



----- Quais alunos tiraram menos que 30 no 1º simulado

select
        simulados.data as data_simulado, simulados.local as local_simulado, simulados.qtd_questoes, alunos.nome, turmas.nome as turma, filiais.local as filial , alunos_simulados.nota as nota_aluno, alunos.escola
        
from 
        simulados, alunos, alunos_simulados, filiais, turmas

where
        alunos.id_turma = turmas.id_turma
and     turmas.id_filial = filiais.id_filial
and     alunos.id_aluno = alunos_simulados.id_aluno
and     simulados.id_simulado = alunos_simulados.id_simulado
and     simulados.id_simulado = 1
and     alunos_simulados.nota < 30



----- Saber quantos alunos são de escola Pública e quais suas turmas

select
        alunos.nome, alunos.escola as tipo_de_escola, turmas.nome, turmas.periodo, filiais.local

from
        alunos, turmas, filiais
        
where
        alunos.id_turma = turmas.id_turma
and     turmas.id_filial = filiais.id_filial
and     alunos.escola = 'Pública'

order by turmas.periodo



----- Saber quais os alunos matriculados na filial de Vila Velha

select
        alunos.nome, turmas.nome, turmas.periodo, filiais.local

from
        alunos, turmas, filiais
        
where
        alunos.id_turma = turmas.id_turma
and     turmas.id_filial = filiais.id_filial
and     filiais.local = 'Vila Velha - ES'





