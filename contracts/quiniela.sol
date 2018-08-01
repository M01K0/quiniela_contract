pragma solidity ^0.4.24;


contract quiniela{
    
    // SRUCTS.

    struct user{
        bool used;
        uint place1; // Id of team 1.
        uint place2; // Id of team 2.
        uint place3; // Id of team 3.
        string name; // Name of the participant.
        uint256 date; // Timestamp.
        bool voted;
        
    }
    
    // TYPES.

    address [] public winners; // Array of winners.
    bool public toVote;
    uint public votes;
    
    address [] public players; // Array of participants.
    mapping (uint => string) public teams; // Id of each team.
    address public constant admin= 0x17d98914dBf1035d808ba2BCa60652F8822b42D4; //Admin of the contract.
    mapping (address => user) public users;
    uint public constant cost= .2 ether;

    // MODIFIERS

    // Check if the sender is the admin of the contract.
    modifier onlyAdmin() {
        require(msg.sender == admin);
        _;
    }
    
    /**
    * @dev This function is executed at initialization and sets the team of the football pool.
    */
    constructor() public {
        teams[1]= "Germany";
        teams[2]= "Argentina";
        teams[3]= "Australia";
        teams[4]= "Belgium";
        teams[5]= "Brazil";
        teams[6]= "Colombia";
        teams[7]= "Costa Rica";
        teams[8]= "Croatia";
        teams[9]= "Denmark";
        teams[10]= "Egypt";
        teams[11]= "England";
        teams[12]= "France";
        teams[13]= "Iceland";
        teams[14]= "Ir Iran";
        teams[15]= "Japan";
        teams[16]= "Korea Republic";
        teams[17]= "Mexico";
        teams[18]= "Morocco";
        teams[19]= "Nigeria";
        teams[20]= "Panama";
        teams[21]= "Peru";
        teams[22]= "Poland";
        teams[23]= "Portugal";
        teams[24]= "Russia";
        teams[25]= "Saudi Arabia";
        teams[26]= "Senegal";
        teams[27]= "Serbia";
        teams[28]= "Spain";
        teams[29]= "Sweden";
        teams[30]= "Switzerland";
        teams[31]= "Tunisia";
        teams[32]= "Uruguay";
    }

    // PUBLIC METHODSS

    /**
    * @dev Function...
    * @param _place1 -
    * @param _place1 -
    * @param _place1 -
    * @param _name - 
    * @param _password -
    */
    function addUser(uint _place1, uint _place2, uint _place3, string _name, string _password)public  payable {
        require(test(_password)); // #crypto_Polla2018
        require(!users[msg.sender].used);
        users[msg.sender].place1=_place1;
        users[msg.sender].place2=_place2;
        users[msg.sender].place3=_place3;
        
        users[msg.sender].name=_name;
        users[msg.sender].date=now;
        users[msg.sender].used=true;
        players.push(msg.sender);
    }
    
    /**
    * @dev Function...
    */
    function setWinners(address [] _winners) public onlyAdmin(){
       winners= _winners;
       toVote= true;
    }
    
    /**
    * @dev Function..
    */
    function vote(bool _vote) public returns (bool) {
        require(toVote);
        require(users[msg.sender].voted == false);
        users[msg.sender].voted=true;
        
        if(_vote){
            votes+=1;
            if(votes > (playersLength()/2)){
                payMoney();
            }
        }
        return true;
    }
    
    /**
    * @dev Function...
    */
    function payMoney() private {
        uint toPay= address(this).balance/(winners.length);
        
        for(uint x = 0; x < winners.length - 1 ; x++ ){
            winners[x].transfer(toPay);
        }
        winners[(winners.length)-1].transfer(address(this).balance);
    }
    
    /**
    * @dev Function...
    */
    function playersLength() public constant returns(uint){
        return players.length;
    }
    
    /**
    * @dev Function to recover the funds on the contract.
    */
    function kill() public onlyAdmin() {
        selfdestruct(admin);
    }

    /**
    * @dev Function to get the winners array.
    */
    function getWinners () public constant returns( address []) {
        return winners;
    }

    // PRIVATE METHODS

    /**
    * @dev Function to compare the password.
    * @return Bool - Valid password.
    */
    function test(string _cad) private pure returns(bool){
        return keccak256(_cad) == 0x2a56a8951ea80f8d88e626b0e9632a3c2fe7c1f6f450a8838e03734380d1c049;
    }
    
    
}