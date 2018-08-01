var Quinela = artifacts.require("../contracts/quiniela");

contract('Quinela', function(accounts) {
  var quinelaInstance;
  it("Creating the instance ( test )", () => {
		return Quinela.deployed()
    	.then( instance => {
        quinelaInstance = instance;
    	})
  });
  it("addUser test function", () => {
    // Function send.
    var _name = "nameTest";
    var _password = "#crypto_Polla2018";
    return quinelaInstance.addUser( 1, 2, 3, _name, _password, { from: '0xb794faC539480856cF99D216bA96181A83717670', value: web3._extend.utils.toWei( '0.2', "ether") } )
      .then( () => {
        return quinelaInstance.addUser( 4, 5, 6, _name, _password, { from: '0xA1b56Df2FAF9F18047311d456c7abC6Daba1e94E', value: web3._extend.utils.toWei( '0.2', "ether") } );
      })
      .then( () => {
        return quinelaInstance.addUser( 7, 8, 9, _name, _password, { from: '0x44DADDaeacF5a31CFa3653013E1E96A8fb8b46fe', value: web3._extend.utils.toWei( '0.2', "ether") } );
      })
      .then( () => {
        return quinelaInstance.addUser( 10, 11, 12, _name, _password, { from: '0x75BC560F4fa4633a3fd177E51922a974f1aCc383', value: web3._extend.utils.toWei( '0.2', "ether") } );
      })
      .then( () => {
        return quinelaInstance.addUser( 13, 14, 15, _name, _password, { from: '0x4F15CCF21c0ADc944aAf99A01220763baBdDBB41', value: web3._extend.utils.toWei( '0.2', "ether") } );
      })
      .then( () => {
        return quinelaInstance.addUser( 16, 17, 18, _name, _password, { from: '0x8588B40EF767a597913207DF57b4A3B227E197A3', value: web3._extend.utils.toWei( '0.2', "ether") } );
      })
      .then( () => {
        return quinelaInstance.addUser( 19, 20, 21, _name, _password, { from: '0x5c96953A1D457203b60F7906CaF3f519FEE6920f', value: web3._extend.utils.toWei( '0.2', "ether") } );
      })
      .then( () => {
        return quinelaInstance.addUser( 22, 23, 24, _name, _password, { from: '0x230ecf62B8Ba553E922CEe21aBa1A8cC02302519', value: web3._extend.utils.toWei( '0.2', "ether") } );
      })
      .then( () => {
        return quinelaInstance.addUser( 25, 26, 27, _name, _password, { from: '0xAF9E1d3F3588d36301354544C908F6B69Cd4B132', value: web3._extend.utils.toWei( '0.2', "ether") } );
      });

  });
  
  it( "setWinners test function", () => {
    var _winners = [ '0xb794faC539480856cF99D216bA96181A83717670', "0xA1b56Df2FAF9F18047311d456c7abC6Daba1e94E" ];
    return quinelaInstance.setWinners( _winners, { from: '0x17d98914dBf1035d808ba2BCa60652F8822b42D4' } );
  });
  
  it( "vote test function ",() => {
    var _vote = true;
    return quinelaInstance.vote( _vote, { from: '0xb794faC539480856cF99D216bA96181A83717670' } )
      .then( () => {
        return quinelaInstance.vote( _vote, { from: '0xA1b56Df2FAF9F18047311d456c7abC6Daba1e94E' } );
      })
      .then( () => {
        return quinelaInstance.vote( _vote, { from: '0x44DADDaeacF5a31CFa3653013E1E96A8fb8b46fe' } );
      })
      .then( () => {
        return quinelaInstance.vote( _vote, { from: '0x75BC560F4fa4633a3fd177E51922a974f1aCc383' } );
      })
      .then( () => {
        return quinelaInstance.vote( _vote, { from: '0x4F15CCF21c0ADc944aAf99A01220763baBdDBB41' } );
      });
  });
  
  it( "playersLength test function" , () => {
    return quinelaInstance.playersLength.call()
    .then( length => {
    	console.log( length.toNumber() );
    	//assert.equal( length.toNumber(), expected, '');
    });
  });

  //Get Array of winners.
  it("getWinners test", () => {
    return quinelaInstance.getWinners.call()
    .then( address => {
      console.log( address );
    });
  });
  

});
