O código utiliza o Provider para gerenciar o estado da aplicação e fornecer acesso aos dados das consultas. As classes CpfProvider e VehicleProvider estendem a classe ChangeNotifier e são registradas como providers no main.dart

O código realiza consultas distintas à API:
Consulta de CPF: A classe CpfRepository faz uma requisição GET para o endpoint /cpf/:cpf da API, recebendo como resposta um JSON com os dados do CPF.
Consulta de Veículo: A classe VehicleRepository faz uma requisição GET para um dos endpoints de veículo da API (/vehicles/:plate, /vehicles/chassi/:chassi ou /vehicles/motor/:motor), recebendo como resposta um JSON com os dados do veículo.

As classes de repositório desserializam as respostas JSON recebidas da API em objetos Dart (cpf_repository e vehicle_repository). Esses objetos são então utilizados pelos providers para atualizar o estado da aplicação. As telas acessam os dados dos providers e os exibem na interface através dos widgets CpfCard e VehicleCard.
