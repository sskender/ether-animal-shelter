# Animal shelter
Decentralized Application on Ethereum Network

### Abilities ###
- [x] Assign contract publisher as shelter owner
- [x] Add new animals to shelter
- [x] Anyone can donate ether
- [x] Adopt animal (results in adopter's address published by the animal's ID)

### To-do ###
- [ ] Frontend

### Warning ###
*This is not a real animal shelter! All Ether sent will be permanently lost!*

### About ###
Project is done only for fun and to learn more about Ethereum. Any suggestions are highly encouraged!

#### Cheatsheet ####
This part is mainly for me (and other newbies).

1. Install testrpc & truffle:
```
https://github.com/trufflesuite/ganache-cli
https://github.com/trufflesuite/truffle
```
2. Create new truffle project or clone this repository:
```
truffle init
```
3. Run testrpc:
```
testrpc -p 7545
```
4. Compile and deploy project to blockchain:
```
truffle compile
truffle migrate
```
If any changes are made be sure to reset:
```
truffle migrate --reset
```
5. Run truffle console to interact:
```
truffle console
```
Or run automated test script:
```
truffle test test/shelter.js
```

#### Console interaction ####
```
AnimalShelter.deployed().then(inst => { app = inst })

app.addAnimal("dog", 35, 4, true)
app.addAnimal("cat", 6, 3, false)
app.animals_count.call()

app.donate({ from: web3.eth.accounts[1], value: web3.toWei(10,"ether") })

app.adopt(0)
app.getInfo(0)
app.getInfo(1)
```
