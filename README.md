# ROS2Gazebo

# Link para o video no YouTube
Você pode ver o projeto em ação no YouTube:
	https://www.youtube.com/watch?v=HGfkfoWSaHw
  
# TurtleBot3 Waypoint Navigator (ROS 2)

Este trabalho apresenta um sistema de navegação autônoma desenvolvido em ROS 2 (Python) para o robô TurtleBot3, operando dentro do ambiente de simulação Gazebo. O objetivo principal é permitir que o robô se desloque entre múltiplos pontos de interesse (representados por blocos coloridos), retornando à sua posição inicial após cada visita, e realizando o desvio de obstáculos através de rotas pré-planejadas.

## 🚀 Funcionalidades

- Navegação baseada em waypoints até múltiplos objetivos
- Retorno automático à origem após alcançar cada alvo
- Controle de posição e orientação via odometria (`/odom`)
- Trajetórias planejadas manualmente para evitar obstáculos fixos
- Encerramento automático ao fim da missão

## 📂 Estrutura do Projeto

```
turtlebot3_control_ros2/
├── navigator_node.py      # Nó principal de navegação
├── package.xml
└── README.md              # Este arquivo
```

## 🔧 Execução

1. Certifique-se de ter o ROS 2 instalado (foxy, humble, iron etc.).
2. Clone o repositório no seu workspace ROS 2:

```bash
cd ~/turtlebot3_ws/src
git clone https://github.com/seu-usuario/turtlebot3_control_ros2.git
```

3. Compile o workspace:

```bash
cd ~/turtlebot3_ws
colcon build
source install/setup.bash
```

4. Inicie o simulador Gazebo com o mundo desejado.

5. Execute o nó de navegação:

```bash
ros2 run turtlebot3_control_ros2 navigator_node
```

## 📌 Estratégia de Navegação

A navegação é realizada por meio de "caminhos de avanço" (forward_paths) que consistem em uma série de waypoints intermediários. O robô se move de ponto a ponto, ajustando sua orientação e distância com base em cálculos derivados da odometria. Uma vez que um alvo é alcançado, o robô reverte o percurso para retornar à sua posição inicial, repetindo este ciclo para cada um dos alvos definidos.


## 🚧 Desvios de Obstáculos

É importante notar que este projeto não faz uso de sensores como o LIDAR para detecção de obstáculos. O desvio é realizado exclusivamente através do planejamento prévio das rotas. Isso significa que obstáculos que surgirem dinamicamente ou que não estiverem mapeados não serão automaticamente evitados pelo robô.

## ⚠️ Limitações

- Não reage a obstáculos inesperados;
- Sensível a ruído na odometria;
- Caminhos fixos, sem replanejamento dinâmico;
- Ele dá uma travadinha quando passa próximo de um obstáculo.

## ✅ Melhorias Futuras

- Integração com `/scan` para desvio dinâmico de obstáculos
- Planejamento de rotas com A*/Dijkstra/RRT
- Controle refinado com PID
- Visualização dos waypoints no Gazebo

## 🧠 Requisitos

- ROS 2 (testado em Ubuntu 22.04 com Humble)
- Gazebo
- TurtleBot3 (model Burger)

---

Criado por Lucas Correa
