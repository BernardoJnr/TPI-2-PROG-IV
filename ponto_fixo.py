import numpy as np

def f(x):
    return np.log(x) + x**2 - 3

def ponto_fixo(phi, x0, epsilon_1=1e-4, epsilon_2=1e-4, iterMax=50):
    """
    
    :param phi: Função de iteração, que define a transformação da equação.
    :param x0: Valor inicial da aproximação.
    :param epsilon_1: Critério de parada baseado no valor da função.
    :param epsilon_2: Critério de parada baseado na diferença entre sucessivas aproximações.
    :param iterMax: Número máximo de iterações permitidas.
    :return: Raiz aproximada e número de iterações realizadas.
    """
    # Verifica se o valor inicial já satisfaz a condição f(x) ≈ 0, encerrando a busca.
    if abs(f(x0)) < epsilon_1:
        return x0, 0
    
    k = 1
    # Executa as iterações até atingir o critério de parada ou o número máximo de iterações.
    while k <= iterMax:
        # Aplica a função de iteração para calcular o próximo valor.
        x1 = phi(x0)
        # Exibe os valores de cada iteração para acompanhamento da convergência.
        print(f"Iteração {k}: x1 = {x1:.6f}, x0 = {x0:.6f}, Diferença = {abs(x1-x0):.6e}, f(x1) = {f(x1):.6e}")
        
        # Critério de parada: f(x) próximo de 0, diferença entre iterações pequena ou número máximo atingido.
        if abs(f(x1)) < epsilon_1 or abs(x1 - x0) < epsilon_2 or k >= iterMax:
            return x1, k
        
        x0 = x1
        k += 1
    
    raise ValueError("Método não convergiu dentro do número máximo de iterações")

# Definição da função de iteração específica para transformar f(x) em x = φ(x).
phi = lambda x: np.sqrt(3 - np.log(x))

# Condições iniciais
x0 = (1 + 2) / 2  # Meio do intervalo [1,2]

# Execução do método
raiz, iteracoes = ponto_fixo(phi, x0)

print(f"Raiz aproximada: {raiz:.6f}")
print(f"Número de iterações: {iteracoes}")
