pragma solidity ^0.4.19 ;
contract PlayerScore {


// 솔리디티 통신 확인용 int

  // function SimpleStorage(int initVal) public {
  //   loggined_player_score = initVal;
  // }

  //function set(int x) public {
  //  loggined_player_score = x;
  //}

  



  // 두개의 return값 출력 (address, score)


// 지갑별 playscore 비교 code
//-----------------------
    uint maxTopScores = 5;

    struct TopScore{
        address addr;
        int score;
    }

    TopScore[] public topScores;

    mapping (address=>uint) public userTopScores;

 function setTopScore(uint _score) public{
        //var currentTopScore = userTopScores[msg.sender];
         
             userTopScores[msg.sender] = _score;
         }

      // 순위에 맞게 저장된 지갑주소 뽑아주기 
      function getplayerscore() public view returns(uint){
        return userTopScores[msg.sender];
    }


    // function setTopScore(int score) {
    //     var currentTopScore = userTopScores[msg.sender];
    //     if(currentTopScore < score){
    //         userTopScores[msg.sender] = score;
    //     }

    //     if(topScores.length < maxTopScores){
    //         var topScore = TopScore(msg.sender, score);
    //         topScores.push(topScore);
    //     }else{
    //         int lowestScore = 0;
    //         uint lowestScoreIndex = 0; 
    //         for (uint i = 0; i < topScores.length; i++)
    //         {
    //             TopScore currentScore = topScores[i];
    //             if(i == 0){
    //                 lowestScore = currentScore.score;
    //                 lowestScoreIndex = i;
    //             }else{
    //                 if(lowestScore > currentScore.score){
    //                     lowestScore = currentScore.score;
    //                     lowestScoreIndex = i;
    //                 }
    //             }
    //         }
    //         if(score > lowestScore){
    //             var newtopScore = TopScore(msg.sender, score);
    //             topScores[lowestScoreIndex] = newtopScore;
    //         }
    //     }
    // }
   
     // 순위에 맞게 지갑주소-점수 mapping 하기 
     
// function get() constant public returns (int retVal) {
//    return loggined_player_score;
//    }
//     function getCountTopScores() returns(uint) {
//         return topScores.length;
//     }

    // get user score function
   // function getTopScore() returns(address addr,int score){
   //     return userTopScores;
  //  }

//----------------------------------------------------
    //mapping address and score 
    //  function get_playerscore_result() public returns (address[]) {
    //     return playscore_result;
    // }


}
