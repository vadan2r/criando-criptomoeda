**Workspace Padrão do Remix**

O workspace padrão do Remix está presente quando:

i. O Remix é carregado pela primeira vez.
ii. Um novo workspace é criado com o template "Default" (Padrão).
iii. Não existem arquivos no File Explorer (Explorador de Arquivos).

Este workspace contém 3 diretórios:

1. "contracts" (contratos): Contém três contratos com níveis crescentes de complexidade.
2. "scripts" (scripts): Contém quatro arquivos TypeScript para implantar um contrato. Mais detalhes abaixo.
3. "tests" (testes): Contém um arquivo de teste Solidity para o contrato "Ballot" e um arquivo de teste JavaScript para o contrato "Storage".

**SCRIPTS**

A pasta "scripts" possui quatro arquivos TypeScript que auxiliam na implantação do contrato "Storage" usando as bibliotecas "web3.js" e "ethers.js".

Para a implantação de qualquer outro contrato, basta atualizar o nome do contrato de "Storage" para o contrato desejado e fornecer os argumentos do construtor de acordo nos arquivos `deploy_with_ethers.ts` ou `deploy_with_web3.ts`.

Na pasta "tests", existe um script contendo testes unitários Mocha-Chai para o contrato "Storage".

Para executar um script, clique com o botão direito no nome do arquivo no explorador de arquivos e clique em "Run" (Executar). Lembre-se, o arquivo Solidity deve já estar compilado.
A saída do script aparecerá no terminal do Remix.

Por favor, observe que require/import é suportado de forma limitada para módulos suportados pelo Remix.
Por agora, os módulos suportados pelo Remix são ethers, web3, swarmgw, chai, multihashes, remix e hardhat somente para o objeto/plugin hardhat.ethers.
Para módulos não suportados, um erro como este será exibido: '<nome_do_modulo> module require is not supported by Remix IDE' ("módulo require de <nome_do_modulo> não é suportado pelo Remix IDE").
