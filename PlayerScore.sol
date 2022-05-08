pragma solidity ^0.4.17;

contract PlayerScore {
    
    // 전송테스트 uint 
    uint public storedData; 

    uint maxTopScores = 5;
    address owner;

    function SimpleStorage(uint initVal) public {
    storedData = initVal;
  }

  function set(uint x) public {
    storedData = x;
  }

  function get() constant public returns (uint retVal) {
    return storedData;
  }



    struct TopScore{
        address addr;
        int score;
    }

    
    function PlayerScore(){
        owner = msg.sender;
    }

    TopScore[] public topScores;

    mapping (address=>int) public userTopScores;
    

    // 유저의 주소-점수를 mapping 시켜서 비교후 5위까지 추려주는 함수 
    function setTopScore(int256 score, uint8 v, bytes32 r, bytes32 s) {

        // 무슨 검증과정인지 sha3() 이해가 아직안됌 ( 아마도 현재연결된계정(owner)과 .. ? 비교 ? ) 
        var hash = sha3(msg.sender, owner, score);
        
        var addressCheck = ecrecover(hash, v, r, s);
        
        if(addressCheck != owner) throw;
        
        var currentTopScore = userTopScores[msg.sender];
        if(currentTopScore < score){
            userTopScores[msg.sender] = score;
        }

        if(topScores.length < maxTopScores){
            var topScore = TopScore(msg.sender, score);
            topScores.push(topScore);
        }else{
            int lowestScore = 0;
            uint lowestScoreIndex = 0; 
            for (uint i = 0; i < topScores.length; i++)
            {
                TopScore currentScore = topScores[i];
                if(i == 0){
                    lowestScore = currentScore.score;
                    lowestScoreIndex = i;
                }else{
                    if(lowestScore > currentScore.score){
                        lowestScore = currentScore.score;
                        lowestScoreIndex = i;
                    }
                }
            }
            if(score > lowestScore){
                var newtopScore = TopScore(msg.sender, score);
                topScores[lowestScoreIndex] = newtopScore;
            }
        }
    }

    function getCountTopScores(uint _number) returns(address player, int player_score) {
        player = topScores[_number].addr;
        player_score = topScores[_number].score;
       
       // return topScores.length;
    }
}
