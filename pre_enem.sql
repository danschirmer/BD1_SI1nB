---------- CREATE TABLE ----------

create table Funcionarios(
    id_func number unique not null,
    cpf_func varchar2(14) primary key,
    nome varchar2(32) not null,
    sobrenome varchar2(32) not null,
    telefone number(9) unique,
    email varchar2(32) unique not null,
    id_end number not null
);


create table Administrativo(
    cargo varchar(32) not null,
    salario number(8,2) not null,
    cpf_func varchar2(14) not null,
    filial_cnpj varchar2(18) not null
);

create table Professores(
    disciplina varchar(32) not null,
    valor_hora number(8,2) not null,
    cpf_func varchar2(14) not null
);

create table Filiais(
    id_filial number primary key,
    cnpj varchar2(18) unique not null,
    nome varchar2(32) not null,
    id_end number not null
);

create table Aulas(
    id_aula number primary key,
    tipo varchar2(32) not null,
    data date not null,
    id_turma number not null,
    professor_cpf varchar2(14) not null
);

create table Turmas(
    id_turma number primary key,
    turno varchar2(32) not null,
    nome_turma varchar(32) unique not null,
    filial_cnpj varchar2(18) not null   
);

create table Alunos(
    id_aluno number unique not null,
    nome varchar2(32) not null,
    sobrenome varchar2(32) not null,
    valor_mensalidade number(8,2) not null,
    tel_resp number(9) not null,
    cpf_aluno varchar2(14) unique,
    email varchar2(60) primary key,
    nome_pai varchar2(32),
    nome_mae varchar2(32),
    tel_aluno number(9),
    id_turma number not null,
    id_end number not null
);

create table Aluno_Simulado(
    id_aluno_simulado number primary key,
    nota number(8,2) not null,
    aluno_email varchar2(60) not null,
    simulado_data date not null
);

create table Simulados(
    id_simulado number not null,
    data date primary key,
    n_questoes number(3) not null,
    local varchar2(32) not null
);

create table Mensalidades(
    id_mensalidade number primary key,
    mes date not null,
    aluno_email varchar2(60) not null
);

create table Endereco(
    id_end number primary key,
    cep varchar2(32) not null,
    rua varchar2(32) not null,
    numero number(8,2),
    bairro varchar2(32) not null,
    cidade varchar2(32) not null,
    filial_cnpj varchar2(18) not null
);


---------- FOREIGN KEY ----------

-- FUNCIONÁRIOS
alter table Funcionarios add constraint fk_endereco_funcionarios foreign key(id_end) references Endereco(id_end);

-- ADMINISTRATIVO
alter table Administrativo add constraint fk_filial_administrativo foreign key(filial_cnpj) references Filiais(cnpj);

-- PROFESSORES
alter table Professores add constraint fk_funcionarios_professores foreign key(cpf_func) references Funcionarios(cpf_func);

-- ENDERECO
alter table Endereco add constraint fk_filial_endereco foreign key(filial_cnpj) references Filiais(cnpj);

-- FILIAIS
alter table Filiais add constraint fk_endereco_filiais foreign key(id_end) references Filiais(id_end); ------- ORA-02270: no matching unique or primary key for this column-list 

-- AULAS
alter table Aulas add constraint fk_professor_aulas foreign key(professor_cpf) references Professores(cpf_func); ------- ORA-02270: no matching unique or primary key for this column-list

-- TURMAS
alter table Turmas add constraint fk_filial_turma foreign key(filial_cnpj) references Filiais(cnpj);

-- ALUNOS
alter table Alunos add constraint fk_turma_alunos foreign key(id_turma) references Turmas(id_turma);
alter table Alunos add constraint fk_endereco_alunos foreign key(id_end) references Endereco(id_end);

-- ALUNOS_SIMULADOS
alter table Aluno_Simulado add constraint fk_aluno_aluno_simulados foreign key(aluno_email) references Alunos(email);
alter table Aluno_Simulado add constraint fk_simulado_aluno_simulados foreign key(simulado_data) references Simulados(data);


-- MENSALIDADES
alter table Mensalidades add constraint fk_aluno_mensalidades foreign key(aluno_email) references Alunos(email);