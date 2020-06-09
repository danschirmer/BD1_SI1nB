---------- CREATE TABLE -------------

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
    id_mensalidade              NUMBER NOT NULL,
    id_turma                    NUMBER NOT NULL    
);  

CREATE TABLE ALUNOS_SIMULADOS (
    id_aluno_simulado     NUMBER NOT NULL PRIMARY KEY,
    nota                  NUMBER(2,2) NOT NULL,
    id_aluno              NUMBER NOT NULL,
    id_simulado           NUMBER NOT NULL
);

CREATE TABLE AULAS (
    id_aula            NUMBER NOT NULL PRIMARY KEY,
    tipo               VARCHAR2(32) NOT NULL,
    data               DATE NOT NULL,
    id_turma           NUMBER NOT NULL,
    id_prof            NUMBER NOT NULL
);

CREATE TABLE FILIAIS (
    id_filial  NUMBER NOT NULL PRIMARY KEY,
    cnpj       VARCHAR2(18) UNIQUE NOT NULL,
    email      VARCHAR2(60) UNIQUE NOT NULL,
    telefone   NUMBER(9) UNIQUE NOT NULL,
    local      VARCHAR2(32) NOT NULL
);

CREATE TABLE MENSALIDADES (
    id_mensalidade  NUMBER NOT NULL PRIMARY KEY,
    mes             DATE NOT NULL
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

CREATE TABLE SIMULADOS (
    id_simulado   NUMBER NOT NULL PRIMARY KEY,
    data          DATE UNIQUE NOT NULL,
    qtd_questoes  NUMBER(3) NOT NULL,
    local         VARCHAR2(32) NOT NULL
);

CREATE TABLE TURMAS (
    id_turma          NUMBER NOT NULL PRIMARY KEY,
    nome              VARCHAR2(32) NOT NULL,
    periodo           VARCHAR2(32) NOT NULL,
    id_filial         NUMBER NOT NULL
);


---------- FOREIGN KEY -------------

ALTER TABLE ADMINISTRATIVOS ADD CONSTRAINT administrativo_filial_fk FOREIGN KEY (id_filial) REFERENCES FILIAIS(id_filial);

ALTER TABLE ALUNOS ADD CONSTRAINT aluno_mensalidade_fk FOREIGN KEY (id_mensalidade) REFERENCES MENSALIDADES(id_mensalidade);

ALTER TABLE ALUNOS_SIMULADOS ADD CONSTRAINT aluno_simulado_aluno_fk FOREIGN KEY (id_aluno) REFERENCES ALUNOS(id_aluno);

ALTER TABLE ALUNOS_SIMULADOS ADD CONSTRAINT aluno_simulado_simulado_fk FOREIGN KEY (id_simulado) REFERENCES SIMULADOS(id_simulado);

ALTER TABLE ALUNOS ADD CONSTRAINT aluno_turma_fk FOREIGN KEY (id_turma) REFERENCES TURMAS(id_turma);

ALTER TABLE AULAS ADD CONSTRAINT aula_professor_fk FOREIGN KEY (id_turma) REFERENCES TURMAS(id_turma);

ALTER TABLE AULAS ADD CONSTRAINT professor_aula_fk FOREIGN KEY (id_prof) REFERENCES PROFESSORES(id_prof);

ALTER TABLE TURMAS  ADD CONSTRAINT turma_filial_fk FOREIGN KEY (id_filial) REFERENCES FILIAIS(id_filial);