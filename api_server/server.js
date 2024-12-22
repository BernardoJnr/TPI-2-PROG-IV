const express = require('express');
const app = express();
const cors = require('cors');
app.use(cors());

const vehicles = [
  { plate: "ABC1D34", model: "Carro 1", status: "Normal", chassi: "123456789", motor: "MTR001" },
  { plate: "XYZ9876", model: "Carro 2", status: "Roubado", chassi: "987654321", motor: "MTR002" },
];

// Função para busca insensível a maiúsculas/minúsculas
function searchIgnoreCase(array, key, value) {
  return array.find(item => item[key]?.toLowerCase() === value.toLowerCase());
}

// Busca por placa
app.get('/vehicles/:plate', (req, res) => {
  const plate = req.params.plate;
  const vehicle = searchIgnoreCase(vehicles, 'plate', plate);
  if (vehicle) {
    res.json(vehicle);
  } else {
    res.status(404).send('Vehicle not found');
  }
});

// Busca por chassi
app.get('/vehicles/chassi/:chassi', (req, res) => {
  const chassi = req.params.chassi;
  const vehicle = searchIgnoreCase(vehicles, 'chassi', chassi);
  if (vehicle) {
    res.json(vehicle);
  } else {
    res.status(404).send('Vehicle not found');
  }
});

// Busca por motor
app.get('/vehicles/motor/:motor', (req, res) => {
  const motor = req.params.motor;
  const vehicle = searchIgnoreCase(vehicles, 'motor', motor);
  if (vehicle) {
    res.json(vehicle);
  } else {
    res.status(404).send('Vehicle not found');
  }
});

const cpfs = {
  "12345678900": { nome: "João da Silva", dataNascimento: "1990-01-01", sexo: "Masculino", situacaoCadastral: "Ativo" },
  "98765432100": { nome: "Maria Oliveira", dataNascimento: "1985-05-10", sexo: "Feminino", situacaoCadastral: "Ativo" },
};

// Busca por CPF
app.get('/cpf/:cpf', (req, res) => {
  const cpf = req.params.cpf;
  const cpfData = cpfs[cpf];
  if (cpfData) {
    res.json(cpfData);
  } else {
    res.status(404).send('CPF não encontrado');
  }
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});