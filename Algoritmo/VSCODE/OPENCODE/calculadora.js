function somar(a, b) {
  return a + b;
}

function subtrair(a, b) {
  return a - b;
}

function multiplicar(a, b) {
  return a * b;
}

function dividir(a, b) {
  if (b === 0) {
    return "Erro: Divisão por zero";
  }
  return a / b;
}

function calculadora() {
  const args = process.argv.slice(2);
  
  if (args.length !== 3) {
    console.log("Uso: node calculadora.js <num1> <operador> <num2>");
    console.log("Operadores: +, -, *, /");
    return;
  }

  const num1 = parseFloat(args[0]);
  const operador = args[1];
  const num2 = parseFloat(args[2]);

  if (isNaN(num1) || isNaN(num2)) {
    console.log("Erro: Números inválidos");
    return;
  }

  let resultado;
  switch (operador) {
    case '+':
      resultado = somar(num1, num2);
      break;
    case '-':
      resultado = subtrair(num1, num2);
      break;
    case '*':
      resultado = multiplicar(num1, num2);
      break;
    case '/':
      resultado = dividir(num1, num2);
      break;
    default:
      console.log("Operador inválido. Use: +, -, *, /");
      return;
  }

  console.log(`Resultado: ${resultado}`);
}

calculadora();