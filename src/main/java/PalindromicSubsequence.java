/**
 * PalindromicSubsequence.java
 *
 * @author: Andrew McBurney
 * @note:   Dynamic programming example which finds the length of the longest
 *          palindromic subinputString and prints it
 */

public class PalindromicSubsequence {
    /**
     * @return: Grid filled out after algorithm execution
     * @note:   Worst case: O(n^2) time complexity, where n is the length of the
     *          string in question
     */
    public static int[][] palindromicSubinputString(String inputString) {
        int n = inputString.length();          // Length of the string
        int gridOfLengths[][] = new int[n][n]; // Declare an n by n grid

        // Fill the diagonals with 1s (each character is a subinputString of 1)
        for (int i = 0; i < n; i++) { gridOfLengths[i][i] = 1; }

        // O(n^2) time complexity
        for (int i = 2; i <= n; i++) {
            for (int j = 0; j < n - i + 1; j++) {
                int k = i + j - 1;

                if (i == 2 && inputString.charAt(j) == inputString.charAt(k)) {
                    System.out.println(true);
                    gridOfLengths[j][k] = 2;
                } else if (inputString.charAt(j) == inputString.charAt(k)) {
                    gridOfLengths[j][k] = gridOfLengths[j + 1][k - 1] + 2;
                } else {
                    gridOfLengths[j][k] = Math.max(
                        gridOfLengths[j + 1][k],
                        gridOfLengths[j][k - 1]
                    );
                }
            }
        }

        return gridOfLengths;
    }

    public static void main(String args[]) {
        String inputString = "ABCABC";
        int grid[][] = palindromicSubinputString(inputString);

        // Maximum value will be in top right corner after algorithm execution
        System.out.println(grid[0][inputString.length() - 1]);
    }
}
