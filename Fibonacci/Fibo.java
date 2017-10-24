
public class Fibo {

    // this is my high school implementation of fibo:
    public int simpleFibo(int n) {
        int s = 0;
        int a = 1;
        int b = 1;
        for(int i = 0; i < n/2; i++) {
            s = b;
            a = a + b;
            b = a + b;
        }  
        return s; 
    }

    // recursive implementation of fibo:
    public int recurFibo(int n) {
        if (n <=1) return n;
        return recurFibo(n - 1) + recurFibo(n - 2);
    }

    // Dynamic Programming Version: of Fibo
    // Recursion with Memoization
    static int[] memo = new int[40];  
    public int recur_memoization_Fibo(int n) {
        if (n <= 1) {
            return n;
        } 
        if (memo[n] != -1) {
            return memo[n];
        }
        memo[n] = recur_memoization_Fibo(n - 1) + recur_memoization_Fibo(n - 2);
        return memo[n];
    }

    public static void main(String[] args) {

        for (int i = 0; i < 40; i ++) {
            memo[i] = -1;
        };

        Fibo f = new Fibo();

        //System.out.println(f.simpleFibo(1));

        //System.out.println(f.recurFibo(1));

        System.out.println(f.recur_memoization_Fibo(10));
    }

}