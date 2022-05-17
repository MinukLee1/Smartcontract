pragma solidity ^0.4.0;

contract PlayerScore {

    uint maxTopScores = 5;

// 솔리디티 통신 확인용 int
    string public loggined_player_score = "aaa";

  function SimpleStorage(string initVal) public {
    loggined_player_score = initVal;
  }

  function set(string x) public {
    loggined_player_score = x;
  }

  function get() constant public returns (string retVal) {
    return loggined_player_score;
  }



//-----------------------
    struct TopScore{
        address addr;
        int score;
    }

    TopScore[] public topScores;

    mapping (address=>int) public userTopScores;

    function setTopScore(int score) {
        
        var currentTopScore = userTopScores[msg.sender];

        if(currentTopScore < score){
            userTopScores[msg.sender] = score;
        }

        if(topScores.length < maxTopScores){
            var topScore = TopScore(msg.sender, score);
            topScores.push(topScore);
        }
        //else{
        //     int lowestScore = 0;
        //     uint lowestScoreIndex = 0; 
        //     for (uint i = 0; i < topScores.length; i++)
        //     {
        //         TopScore currentScore = topScores[i];
        //         if(i == 0){
        //             lowestScore = currentScore.score;
        //             lowestScoreIndex = i;
        //         }else{
        //             if(lowestScore > currentScore.score){
        //                 lowestScore = currentScore.score;
        //                 lowestScoreIndex = i;
        //             }
        //         }
        //     }
        //     if(score > lowestScore){
        //         var newtopScore = TopScore(msg.sender, score);
        //         topScores[lowestScoreIndex] = newtopScore;
        //     }
        
    }
    
    // get user score function
   // function getTopScore() returns(address addr,int score){
   //     return userTopScores;
  //  }

    function getCountTopScores() returns(uint) {
        return topScores.length;
    }
}
