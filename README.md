Aluno: JACQUELINE MARQUES LARA DE ALMEIDA Email: jackellitamarques@gmail.com

Festa VIP
Este é um projeto desenvolvido como parte do curso de Ruby on Rails. O objetivo é aplicar os conceitos aprendidos em aula para criar uma aplicação web funcional, bem estruturada e com boas práticas de desenvolvimento. No futuro ele será convertido em um SaaS, portanto todo código dele será comercializado.

📦 Tecnologias Utilizadas
Ruby 3.1.0
Ruby on Rails 7.2
PostgreSQL
Sidekiq (opcional)
Redis (opcional)
🚀 Como rodar o projeto localmente

# Clone o repositório

git clone https://github.com/seu-usuario/nome-do-projeto.git
cd nome-do-projeto

# abra o VSCode

# Inicie o projeto dentro do dev container

# Inicie o projeto localmente

- Baixe ruby 3.1.0,
- Instale o bundler
- Execute bundle install
- rails db:create / rails db:migrate e por fim rails db:seeds para poder utilizar o sistema já com alguns usuários

✅ Funcionalidades implementadas

Cadastro e login de usuários com autenticação
CRUD de convidados e participantes
CRUD de usuários
Background job para envio de e-mails
Sistema de permissões com roles diferentes
Cáculo de alimentos da festa
Relatório de participantes para entregar na entrada do salão

🧠 Conceitos aplicados
Abaixo estão os conceitos aprendidos em aula e aplicados neste projeto, junto com a justificativa de sua utilização:

1. **Service Objects**
   Utilizados para encapsular regras de negócio complexas fora dos models e controllers, mantendo o código mais limpo e testável. Podemos observar no projeto a classe MealCaltulation que faz isso e isso onde podemos comprovar o benefício da utilização desse conceito, visto que calculo de alimentos é algo que não faz sentido estar em nenhuma model ou controller pois é apenas utilitária.

2. **ActiveJob + Sidekiq**
   Usado para processamento assíncrono de tarefas demoradas, como envio de e-mails, sem bloquear o fluxo da aplicação. Aqui escolhi usar esse conceito para que envie um email atualizado com relatório de participantes a cada 3 dias.

3. **Design Patterns**
   Aplicados para organizar melhor o código em casos onde os formulários possuem lógica de validação ou exibição mais complexa. Escolhi usar o form objects para possibilitar desacoplar tal classe e assim ter o benefício disso disso e disso.

4. **Dev Container**

   - Utilizado para garantir que o ambiente de desenvolvimento seja idêntico para todos os colaboradores, com Ruby, Yarn, Node e PostgreSQL prontos para uso com um clique via VSCode.

5. **Atualização dinâmica: Hotwire Stimulus**

   - Utilizados para criar interatividade e atualizações dinâmicas na interface do usuário sem depender de JavaScript pesado ou frameworks como React/Vue. No projeto FestaVIP, o Stimulus é usado para controlar a adição e remoção de convidados no formulário de forma fluida, enquanto o Turbo (parte do Hotwire) permite atualizações parciais de página sem recarregar tudo — tornando a experiência mais rápida e amigável.

6. **Lambdas**

   - Utilização uma função lambda na model Guest para validar a presença do RG apenas quando o tipo de convidado é adult. Isso é necessário porque, no momento em que a validação é definida, o método guest_type ainda não está disponível. O lambda garante que a verificação só ocorra em tempo de execução, quando a instância já está completamente carregada.

7. **Cache Técnica Russian Doll (ideal para tabelas)**
   - Utilizado no relatório de participação da festa cache com a técnica Russian Doll pois ela é ideal para tabelas já que essa técnica permite cachear partes menores e reaproveitáveis da tabela (como cada linha), invalidando somente o que mudou, em vez de recarregar toda a tabela.
