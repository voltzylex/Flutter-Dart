// Brute Force
class Solution {
  List<int> twoSum(List<int> nums, int target) {
    List<int> sol = [];
    for(int i=0;i<nums.length;i++){
        for(int j=0;j<nums.length;j++){
            if(i==j){
                continue;
            }
            if(nums[i]+nums[j]==target){
                sol.addAll([i,j]);
              return sol;
            }
        }
    }
    return sol;
  }
}
// Brute Force v2
class Solution {
  List<int> twoSum(List<int> nums, int target) {
    List<int> sol = [];
    for(int i=0;i<nums.length;i++){
        for(int j=i+1;j<nums.length;j++){
            // if(i==j){
            //     continue;
            // }
            if(nums[i]+nums[j]==target){
                sol.addAll([i,j]);
              return sol;
            }
        }
    }
    return sol;
  }
}
// Better Approach using hash map
// Brute Force
class Solution {
  List<int> twoSum(List<int> nums, int target) {
Map<int,int> map = {};
  for (int i = 0; i < nums.length; i++) {
    int num = nums[i];
    int complement = target - num;

    if (map.containsKey(complement)) {
      return [map[complement]!, i];
    }

    map[num] = i;
  }
  return [];
}
}