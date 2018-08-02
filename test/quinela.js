var Quinela = artifacts.require("../contracts/quiniela");

contract('Quinela', function(accounts) {
  var quinelaInstance;
  it("Creating the instance ( test )", () => {
		return Quinela.deployed()
    	.then( instance => {
        quinelaInstance = instance; // Instance of the contract.
    	})
  });
  it("addUser test function", () => {
    // Function send.
    var _name = "nameTest"; // Name for test.
    var _password = "#crypto_Polla2018"; // Password of the footbal pool.
    return quinelaInstance.addUser( 1, 2, 3, _name, _password, { from: accounts[0], value: web3._extend.utils.toWei( '0.2', "ether") } )
      .then( () => {
        return quinelaInstance.addUser( 4, 5, 6, _name, _password, { from: accounts[1], value: web3._extend.utils.toWei( '0.2', "ether") } );
      })
      .then( () => {
        return quinelaInstance.addUser( 7, 8, 9, _name, _password, { from: accounts[2], value: web3._extend.utils.toWei( '0.2', "ether") } );
      })
      .then( () => {
        return quinelaInstance.addUser( 10, 11, 12, _name, _password, { from: accounts[3], value: web3._extend.utils.toWei( '0.2', "ether") } );
      })
      .then( () => {
        return quinelaInstance.addUser( 13, 14, 15, _name, _password, { from: accounts[4], value: web3._extend.utils.toWei( '0.2', "ether") } );
      })
      .then( () => {
        return quinelaInstance.addUser( 16, 17, 18, _name, _password, { from: accounts[5], value: web3._extend.utils.toWei( '0.2', "ether") } );
      })
      .then( () => {
        return quinelaInstance.addUser( 19, 20, 21, _name, _password, { from: accounts[6], value: web3._extend.utils.toWei( '0.2', "ether") } );
      })
      .then( () => {
        return quinelaInstance.addUser( 22, 23, 24, _name, _password, { from: accounts[7], value: web3._extend.utils.toWei( '0.2', "ether") } );
      })
      .then( () => {
        return quinelaInstance.addUser( 25, 26, 27, _name, _password, { from: accounts[8], value: web3._extend.utils.toWei( '0.2', "ether") } );
      });

  });
  
  it( "setWinners test function", () => {
    var _winners = [ accounts[0] ]; // Address array of the winners
    return quinelaInstance.setWinners( _winners, { from: accounts[9] } );
  });
  
  it( "vote test function ",() => { // 
    var _vote = true;
    return quinelaInstance.vote( _vote, { from: accounts[0] } )
      .then( () => {
        return quinelaInstance.vote( _vote, { from: accounts[1] } );
      })
      .then( () => {
        return quinelaInstance.vote( _vote, { from: accounts[2] } );
      })
      .then( () => {
        return quinelaInstance.vote( _vote, { from: accounts[3] } );
      })
      .then( () => {
        return quinelaInstance.vote( _vote, { from: accounts[4] } );
      });
  });
  
  it( "playersLength test function" , () => {
    return quinelaInstance.playersLength.call()
    .then( length => {
    	console.log( "Players: " + length.toNumber() ); // Numbers of players.
    	//assert.equal( length.toNumber(), expected, '');
    });
  });

});
