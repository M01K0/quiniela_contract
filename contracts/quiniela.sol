pragma solidity ^0.4.24;

/** @title quiniela. */
contract quiniela{
    
    // SRUCTS.

    struct user{        // Struct of the player.
        bool    used;   // If this addres is used.
        uint    place1; // Id of team 1.
        uint    place2; // Id of team 2.
        uint    place3; // Id of team 3.
        string  name;   // Name of the participant.
        uint256 date;   // Timestamp.
        bool    voted;
        
    }
    
    // TYPES.

    address [] public winners;              // Array of winners.
    bool public toVote; 
    uint public votes;                      // Count of number of votes.
    address [] public players;              // Array of participants.
    mapping (uint => string) public teams;  // Id of each team.
    address public constant admin = 0x627306090abab3a6e1400e9345bc60c78a8bef57; //Admin of the contract. accounts[9] of truffle.
    mapping (address => user) public users;
    uint public constant cost = 0.2 ether;  // Cost tu enter in the football pool.

    // MODIFIERS.

    // Check if the sender is the admin of the contract.
    modifier onlyAdmin() {
        require( msg.sender == admin );
        _;
    }

    // CONSTRUCTOR.
    
    /**
    * @dev This function is executed at initialization and sets the team of the football pool.
    */
    constructor() public {
        teams[1] = "Germany";
        teams[2] = "Argentina";
        teams[3] = "Australia";
        teams[4] = "Belgium";
        teams[5] = "Brazil";
        teams[6] = "Colombia";
        teams[7] = "Costa Rica";
        teams[8] = "Croatia";
        teams[9] = "Denmark";
        teams[10] = "Egypt";
        teams[11] = "England";
        teams[12] = "France";
        teams[13] = "Iceland";
        teams[14] = "Ir Iran";
        teams[15] = "Japan";
        teams[16] = "Korea Republic";
        teams[17] = "Mexico";
        teams[18] = "Morocco";
        teams[19] = "Nigeria";
        teams[20] = "Panama";
        teams[21] = "Peru";
        teams[22] = "Poland";
        teams[23] = "Portugal";
        teams[24] = "Russia";
        teams[25] =  "Saudi Arabia";
        teams[26] = "Senegal";
        teams[27] = "Serbia";
        teams[28] = "Spain";
        teams[29] = "Sweden";
        teams[30] = "Switzerland";
        teams[31] = "Tunisia";
        teams[32] = "Uruguay";
    }

    // PUBLIC METHODSS

    /**
    * @dev Function to add an user, the user need the password.
    * @param _place1 - Uint - To set the place 1.
    * @param _place1 - Uint - To set the place 2.
    * @param _place1 - Uint - To set the place 3.
    * @param _name - String - To set the name.
    * @param _password - String - Password of the football pool.
    */
    function addUser ( uint _place1, uint _place2, uint _place3, string _name, string _password ) public  payable {
        require( isPassword( _password ) ); // #crypto_Polla2018
        require( !users[msg.sender].used );
        require( cost <= msg.value );
        users[msg.sender].place1 = _place1; // Set _place1.
        users[msg.sender].place2 = _place2; // Set _place2.
        users[msg.sender].place3 = _place3; // Set _place3.
        users[msg.sender].name = _name;     // Set name.
        users[msg.sender].date = now;       // Set timestamp.
        users[msg.sender].used = true; 
        players.push(msg.sender);           // Push to the array.
    }
    
    /**
    * @dev Function to set the winners to the winners array.
    */
    function setWinners ( address [] _winners ) public onlyAdmin() {
       winners = _winners;
       toVote = true;
    }
    
    /**
    * @dev Function to vote. Pay the money if more than 50% of the particiants are agree.
    */
    function vote ( bool _vote ) public returns ( bool ) {
        require( toVote );                           // The participant can vote.
        require( users[msg.sender].voted == false ); // The participant vote.
        users[msg.sender].voted = true;
        if( _vote ) {
            votes += 1;                              // Increment in 1 the votes.
            if( votes > ( playersLength() / 2 ) ) {
                payMoney();                          // Call 'payMoney ' function.
            }
        }
        return true;
    }
    
    /**
    * @dev Function to pay the money to each winner.
    */
    function payMoney () private {
        uint toPay= address( this ).balance / winnersLength();              // Ether assigned for each winner.

        for( uint x = 0; x < winnersLength() - 1 ; x++ ) {
            winners[x].transfer( toPay );                                   // Transfer ether to the winner.
        }
        winners[ winnersLength() - 1 ].transfer( address( this ).balance ); // Transfer the rest of the ether.
    }
    
    /**
    * @dev Function to get players array length.
    */
    function playersLength () public constant returns ( uint ) {
        return players.length;
    }

    /**
    * @dev Function to get winners array length.
    */
    function winnersLength () public constant returns ( uint ) {
        return winners.length;
    }
    
    /**
    * @dev Function to recover the funds of the contract.
    */
    function kill () public onlyAdmin() {
        selfdestruct( admin );
    }

    // PRIVATE METHODS

    /**
    * @dev Function to compare the password.
    * @return Bool - Valid password.
    */
    function isPassword( string _cad ) private pure returns ( bool ) {
        return keccak256( abi.encodePacked( _cad ) ) == 0x2a56a8951ea80f8d88e626b0e9632a3c2fe7c1f6f450a8838e03734380d1c049;
    }
    
}