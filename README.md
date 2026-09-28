# Laboratório de Sistemas Digitais — VHDL

Repositório destinado aos experimentos e exercícios desenvolvidos em **VHDL** na disciplina de **Laboratório de Sistemas Digitais**.

## 📁 Estrutura

Os arquivos estão organizados por experimento:

```text
.
├── exp2/
├── exp3/
├── exp4/
└── README.md
```

Dentro de cada experimento podem existir pastas separadas por questão, contendo os códigos VHDL e seus respectivos testbenches.

Exemplo:

```text
exp3/
├── exp3_q1/
│   ├── mux8x1.vhd
│   └── tb_mux8x1.vhd
└── exp3_q2/
    ├── decoder4x16.vhd
    └── tb_decoder4x16.vhd
```

## 🛠️ Tecnologias utilizadas

- **VHDL**
- **ModelSim**
- Simulação por **testbench**
- Análise de formas de onda

## ▶️ Como executar

1. Abra o **ModelSim**.
2. Crie um projeto ou adicione os arquivos `.vhd` do experimento desejado.
3. Compile os arquivos.
4. Compile o respectivo testbench.
5. Inicie a simulação do testbench.
6. Adicione os sinais à janela **Wave** e execute a simulação.

Exemplo de comandos no ModelSim:

```tcl
vcom arquivo.vhd
vcom tb_arquivo.vhd
vsim work.tb_arquivo
add wave *
run -all
```

## 📚 Conteúdos abordados

Entre os circuitos desenvolvidos ao longo dos experimentos estão:

- Multiplexadores
- Decodificadores
- Circuitos combinacionais
- Somadores
- Implementação e simulação de circuitos digitais em VHDL

## 👤 Autor

**João Eduardo**

---

Repositório acadêmico criado para armazenar e acompanhar a evolução dos experimentos desenvolvidos durante a disciplina.
