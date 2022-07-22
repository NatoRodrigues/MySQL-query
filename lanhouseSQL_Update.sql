drop database lanhouseads;
create database lanhouseads;

use lanhouseads;

create table Empregado(
  CPF varchar(14) NOT NULL unique PRIMARY KEY,
  nome varchar(45) not null,
  nomeSocial VARCHAR(45) NULL,
  sexo char(3) NOT NULL,
  salario DECIMAL (6,2) NOT NULL,
  email VARCHAR (45) UNIQUE NOT NULL,
  telefone VARCHAR(11) NOT NULL,
  dataNasc DATE NOT NULL,
  dataAdmi DATETIME NOT NULL,
  dataDemi DATETIME NULL,
  statusEmpregaticio TINYINT NOT NULL,
  quantidade_vendas int not null
);

ALTER TABLE Empregado add quantidade_vendas int not null;

INSERT INTO Empregado (CPF, nome, sexo, salario, email, telefone, dataNasc, dataAdmi, statusEmpregaticio, quantidade_vendas) 
Values ("741.526.842-31", 'Carlos almeida', 'M', 1560.00, "carlosameida@gmail.com", "81984512428", '1998-11-05', '2022-04-14 10:45:02', 1, 2);
INSERT INTO Empregado (CPF, nome, sexo, salario, email, telefone, dataNasc, dataAdmi, statusEmpregaticio, quantidade_vendas) 
VALUES ("658.478.124-87", 'Patricia martins ferrato', 'F', 2145.00, 'patricia12@gmail.com', "81984668767", '2000-12-02', '2020-09-15 10:45:02', 1, 3),
("127.549.225-69", 'Matheus marques da silva', 'M', 3000.00, 'Math24@gmail.com', "8199945478", '1989-05-05', '2022-01-12 15:45:08', 1,5),
("121.478.451-27", 'vinicius silva junior', 'M', 8500.00, 'vinijr5@gmail.com', "81984447285", '1987-10-05', '2019-08-21 12:46:07', 1, 4),
("774.414.581-26", 'Renato Rodrigo mendes', 'M', 4541.00,'carlosameida235@gmail.com', "11984542578", '1991-05-05', '2022-04-14 09:25:00', 1, 10);
  

INSERT INTO Empregado(quantidade_vendas)
values(2),
(3),
(5),
(4),
(10);  
 
create table Cliente (
 CPF varchar(14) NOT NULL unique PRIMARY KEY,
 nome varchar(45) not null,
 email VARCHAR (45) UNIQUE NOT NULL,
 senha varchar(100),
 sexo char(3) NOT NULL,
 dataNasc date not null,
 telefone varchar(11)
 );
 
 INSERT INTO Cliente (CPF, nome, email, senha, sexo, dataNasc, telefone)
 values ("712.471.348-47", 'davi albuquerque',"davialb@gmail.com", "185478494", 'M', '2002-03-04', "81845512478"),
		("127.549.225-14", 'diana melo cruz',"dianaMelo@gmail.com", "185478494", 'F', '1989-05-06', "81848512478"),
		("178.549.245-28", 'daniela medeiros',"daniMed@gmail.com", "185478494", 'F', '1995-10-11', "81874512478"),
        ("179.928.977-48", 'mariana ribeiro',"marib@hotmail.com", "185478494", 'F', '2001-10-08', "81871512478"),
        ("136.334.220-84", 'danilo junior',"danilojr@gmail.com", "185478494", 'M', '2000-11-04', "81841512478");


create table Endereco (
   idEndereco INT not null primary key,
    UF varchar(2) not null,
    cidade varchar(45) not null,
    bairro varchar(45) not null,
    rua varchar(45) not null,
    numero INT not null,
    comp varchar(45) null,
    cep varchar(9) not null,
    Empregado_CPF varchar(14) not null,
    foreign key(Empregado_CPF) references Empregado(CPF)
    on update cascade
    on delete cascade);
    
    
create table Ferias  (
   idFerias INT primary key not null,
   anoRef year(4),
   qtdDias INT not null,
   DataIni DATE not null,
   DataFim date not null,
   Empregado_CPF varchar(14) not null,
   foreign key(Empregado_CPF) references Empregado(CPF)
   on update cascade
   on delete cascade);
   
   
insert into Endereco (idEndereco, UF, cidade, bairro, rua, numero, cep, Empregado_CPF)
value("142", 'PE', 'Recife',"ibura", "rua fulano de tal3", 462, "51751-154", "741.526.842-31"),
("145", 'PE', 'Olinda',"casa caiada", "rua 412", 421, "41821-714", "658.478.124-87"),
("621", 'PE', 'Recife',"iputinga", "cordislandia", 225, "51481-474", "127.549.225-69"),
("611", 'PE', 'Recife',"boa viagem", "rua fulano de tal2", 148, "52000-154", "121.478.451-27"),
("004", 'PE', 'Recife',"torre", "rua real da torre", 144, "52751-144", "774.414.581-26");
  
 insert into Ferias (idFerias, anoRef, qtdDias, DataIni, DataFim, Empregado_CPF)
 values(121, '2021', 30,'2021-05-01', '2021-06-01', "741.526.842-31"),
(141, '2022', 31, '2021-06-01','2021-07-02', "658.478.124-87"),
(184, '2020', 28, '2020-05-05',	'2020-06-02', "127.549.225-69"),
(248, '2021', 32, '2021-10-05','2021-11-06', "121.478.451-27"),
(384, '2022', 30, '2022-06-06','2022-07-06', "774.414.581-26");

create table Vendas(
   idVendas int primary key not null unique,
   dataVenda DATETIME not null,
   valorTotal Decimal(6,2),
   desconto DECIMAL (4,2),
   Cliente_CPF varchar(14) not null unique,
   Empregado_CPF VARCHAR(14) not null unique
); 

INSERT INTO Vendas(idVendas, dataVenda, valorTotal, desconto, Cliente_CPF,  Empregado_CPF)
VALUES(1, '2021-04-01', 2141.00, 80.00, "712.471.348-47", "741.526.842-31"),
	  (2, '2022-04-04', 3000.00, 99.00, "127.549.225-14", "127.549.225-69"),
      (21, '2022-02-14', 2999.99, 99.00, "178.549.245-28", "658.478.124-87"),
      (36, '2020-10-15', 1500.00, 75.00, "179.928.977-48", "121.478.451-27"),
      (8, '2022-06-08', 2499.99, 89.90, "136.334.220-84", "774.414.581-26");
      
create table Estoque (
   idProduto INT PRIMARY KEY NOT NULL,
   Nome VARCHAR(45),
   Valor DECIMAL (6,2),
   Quantidade INT NULL,
   Categoria VARCHAR(45),
   Validade DATE not null,
   Marca VARCHAR (45) NULL
);

select * from Estoque;

INSERT INTO Estoque(idProduto, Nome, Valor, Quantidade, Categoria, Validade, Marca)
VALUES(0468, "PLACA DE VIDEO 1050Ti", 1548.00, 5, "Hardware", '2022-05-04', "nvidia"),
	  (0332, "PLACA DE VIDEO RTX 3060", 3678.00, 4, "Hardware", '2024-12-09', "nvidia"),
      (1434, "Monitor GAMER", 1319.90, 6, "Periférico", '2028-06-03', "Samsung"),
      (1662, "Fone GAMER", 1389.00, 2, "Periférico", '2029-10-01', "RAZER"),
      (0666, "Processador INTEL CORE i9", 2579.90, 2, "Hardware", '2029-10-01', "INTEL");
      
create table itensVendas (
   Estoque_idProduto int unique not null,
   Vendas_idVendas int unique not null,
   Quantidade int not null
);


INSERT INTO itensVendas (Estoque_idProduto, Vendas_idVendas, Quantidade)
values(0468, 1, 6),
	  (0332, 2, 2),
      (1434, 21, 2),
      (1662, 36, 3),
      (0666, 8, 1);

ALTER TABLE Estoque CHANGE Nome NomeEstq integer(5) unsigned;
      
select sum(Quantidade), Estoque.Nome from itensVendas, Estoque
	Where itensVendas.Estoque_idProduto = Estoque.idProduto and
			itensVendas.Vendas_idVendas = Vendas_idVendas
    group by itensVendas.Quantidade
order by sum(quantidade) desc;
      
INSERT INTO itensVendas (Nome)
VALUES("PLACA DE VIDEO 1050Ti"),
	  ("PLACA DE VIDEO RTX 3060"),
      ("Monitor GAMER"),
      ("Fone GAMER"),
      ("Processador INTEL CORE i9");
      
	
create table FormaPag(
   idFormPag INT PRIMARY KEY NOT NULL UNIQUE,
   tipoPag VARCHAR(45) NOT NULL,
   valorPag DECIMAL(6,2) NOT NULL,
   dataPag DATETIME NOT NULL,
   Vendas_idVendas INT,
   foreign key (Vendas_idVendas) references Vendas(idVendas)
   on update cascade
   on delete cascade
);
   
INSERT INTO FormaPag (idFormPag, tipoPag, valorPag, dataPag, Vendas_idVendas)
VALUES(15256, "Cartão de Débito", 2061.00, '2021-04-01', 1),
	  (18082, "Boleto Bancário", 2901.00, '2022-04-04', 2),  
	  (35421, "Boleto Bancário", 2900.99, '2022-02-14', 21),
	  (20900, "Cartão de crédito à Vista", 1425.00, '2020-10-15', 36),
	  (48124, "PIX", 2409.10, '2022-06-08', 8);
         
create table VendaServico(
    Vendas_idVendas INT not null UNIQUE,
    Servico_idServico INT NOT NULL UNIQUE,
    Quantidade INT not null
);

INSERT INTO VendaServico(Vendas_idVendas, Servico_idServico, Quantidade)
VALUES(1, 451, 6),
      (2, 331, 12),
      (21, 512, 5),
      (36, 128, 2),
      (8, 174, 15);

create table Servico(
    idServico INT PRIMARY KEY NOT NULL UNIQUE,
    Nome Varchar(45) NOT NULL,
    Valor DECIMAL(5,2)
);

INSERT INTO Servico (idServico, Nome, Valor)
VALUES(451, "FORMATAÇÃO", 100.00),
(331, "INSTALAR INTERNET", 160.00),
(512, "RECEBIMENTO DE PAGAMENTO", 100.00),
(128, "ASSISTÊNCIA DE PEÇAS", 500.00),
(174, "VENDA DE PERIFÉRICOS", 100.00);

create table Fornecedor (
    CNPJ_CPF VARCHAR(15) UNIQUE PRIMARY KEY NOT NULL,
    Nome VARCHAR(45) NOT NULL,
    Telefone VARCHAR(11) NOT NULL,
    Email VARCHAR(45) NOT NULL UNIQUE
    );
    
 INSERT INTO Fornecedor (CNPJ_CPF, Nome, Telefone, Email)
 VALUES("12776114/000107", "HYPERX DO BRASIL", "11997461237", "HYPERXBRASIL@GMAIL.COM.BR"),
       ("79923639/000107", "NVIDIA DO BRASIL", "11997784118", "NVIDIABR@GMAIL.COM.BR"),
	   ("5698814/000151", "SAMSUNG OFICIAL", "11985567238", "SAMSUNG_OFFICIAL@GMAIL.COM.BR"),
       ("00864256/000147", "RAZER DO BRASIL", "11986831422", "RAZERBRASIL@GMAIL.COM.BR"),
       ("85222209/000152", "INTEL OFICIAL", "11987364287", "INTELBRASIL@GMAIL.COM.BR");
 
create table EstoqueFornecedor (
    Estoque_idProduto INT NOT NULL,
    Fornecedor_CNPJ_CPF VARCHAR(15) UNIQUE NOT NULL
); 

  INSERT INTO EstoqueFornecedor (Estoque_idProduto, Fornecedor_CNPJ_CPF)
  VALUES(0468, "12776114/000107"),
        (0332, "79923639/000107"),
        (1434, "5698814/000151"),
        (1662, "00864256/000147"),
        (0666, "85222209/000152");
 
 create table ServicoFornecedor(
    Servico_idServico INT NOT NULL UNIQUE,
    Fornecedor_CNPJ_CPF VARCHAR(15) UNIQUE NOT NULL
 );
    
    INSERT INTO ServicoFornecedor(Servico_idServico, Fornecedor_CNPJ_CPF)
    VALUES (451, "12776114/000107"),
		   (331, "79923639/000107"),
           (512, "5698814/000151"),
           (128, "00864256/000147"),
           (174, "85222209/000152");
           
           
select * from endereco;

delete from Endereco
   where cidade like "Oli%";
   
   SET SQL_SAFE_UPDATES = 0;
   
INSERT INTO Endereco(idEndereco, UF, cidade, bairro, rua, numero, cep, Empregado_CPF) 
VALUE("145", 'PE', 'Olinda',"casa caiada", "rua 412", 421, "41821-714", "658.478.124-87");

use lanhouseads;
select * from lanhouseads;

show tables;

-- Relatório 1:

select * from Empregado
	where dataAdmi between '2022-01-01' and '2022-03-31'
		ORDER BY STR_TO_DATE(dataAdmi, '%d-%m-%Y');
        
-- Relatório 2:
 
select nome as "Nome", salario "Salario", email "E-mail", dataAdmi "Data Admissão", dataDemi "Data demissão"
	from empregado
		where salario < (select avg(salario) from empregado)
			order by nome;
        
-- Relatório 3:
        
select Empregado.nome, empregado.sexo, empregado.salario
from empregado;
select itensVendas.Quantidade
from itensVendas
    order by Quantidade;
    
-- Relatório 4

select FormaPag.tipoPag, FormaPag.Vendas_idVendas
from FormaPag
	where Vendas_idVendas > 20;
select itensVendas.Quantidade
from itensVendas
	order by Quantidade;
    
-- Relatório 5: 

select vendas.dataVenda, vendas.valorTotal
	from vendas
		order by dataVenda;
select Estoque.Nome, Estoque.Valor
	from Estoque;
select Empregado.nome
	from Empregado;
select itensVendas.Quantidade
	from itensVendas;
        
-- Relatório 6:

select vendas.dataVenda as "Data da Venda", Servico.Nome as "Nome do serviço", VendaServico.Quantidade as "Quantidade de serviços vendidos", 
Servico.Valor as "Valor do servico",  vendas.valorTotal as "Valor total", Empregado.Nome as "Nome do funcionário"
	from vendas, VendaServico, Servico, Empregado
		where VendaServico.Vendas_idVendas = Vendas.idVendas and 
			VendaServico.Servico_idServico = Servico.idServico and
					vendas.Empregado_CPF = Empregado.CPF
			order by dataVenda;
            
-- Relatório 7:

select Estoque.Nome as "Nome Produto", Estoque.Valor as "Valor do Produto", Fornecedor.Email as "Email do fornecedor", 
Fornecedor.Telefone as "Telefoone do Fornecedor"
	from Estoque, Fornecedor, EstoqueFornecedor
		where EstoqueFornecedor.Estoque_idProduto = Estoque.idProduto and
			EstoqueFornecedor.Fornecedor_CNPJ_CPF = Fornecedor.CNPJ_CPF
				order by Estoque.Nome;
                
                
-- Relatório 8:

select Servico.Nome as "Nome do Serviço", Servico.Valor as "Valor do servico", Fornecedor.Nome as "Nome do fornecedor", 
Fornecedor.Email as "Email do Fornecedor", Fornecedor.Telefone as "Telefone do Fornecedor"
	from Servico, Fornecedor, ServicoFornecedor
		where ServicoFornecedor.Servico_idServico = Servico.idServico and
			ServicoFornecedor.Fornecedor_CNPJ_CPF = Fornecedor.CNPJ_CPF
				order by Servico.Nome;
					
-- Relatório 9:

select sum(Quantidade) as "Quantidade de vendas", Estoque.Nome as "Nome do produto"from itensVendas, Estoque
	Where itensVendas.Estoque_idProduto = Estoque.idProduto and
		itensVendas.Vendas_idVendas = Vendas_idVendas
			group by itensVendas.Quantidade
				order by sum(quantidade) desc;
				
	
-- Relatório 10:

select sum(Quantidade) as "Quantidade de vendas", Servico.Nome as "Nome do servico"
	from VendaServico, Servico
		where VendaServico.Vendas_idVendas = Vendas_idVendas and
				 VendaServico.Servico_idServico =  Servico.idServico
					group by VendaServico.Quantidade
						order by sum(Quantidade) desc;


