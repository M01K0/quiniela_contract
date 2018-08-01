pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/quiniela.sol";

contract TestQuiniela {

  quiniela quin = quiniela(DeployedAddresses.quiniela());

  function testAddUser() public {
    quin.addUser( 1, 2, 3, "nameTest", "#crypto_Polla2018" );
  }

  function testPlayersLength () public {
    uint expected = 1;
    Assert.notEqual( quin.playersLength() , expected, "");
    //return quin.playersLength();
  }

  function testSetWinners() public {
    
  }

  function testVote() public {

  }

  function testTest() public {
    
  }

  /*
  function testInitialBalanceUsingDeployedContract() public {
    MetaCoin meta = MetaCoin(DeployedAddresses.MetaCoin());

    uint expected = 10000;

    Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially");
  }

  function testInitialBalanceWithNewMetaCoin() public {
    MetaCoin meta = new MetaCoin();

    uint expected = 10000;

    Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially");
  }
  */
  
}
