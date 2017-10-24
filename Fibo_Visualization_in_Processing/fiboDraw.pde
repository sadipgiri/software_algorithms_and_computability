void setup() {
  size(1000, 1000);
}
 
void draw() {
  for(int i = 0; i < 20; i++) {
    int f = recurFibo(i);
    fill(f);
    rect(f, f, f, f);
  };
}

int recurFibo(int n) {
        if (n <=1) return n;
        return recurFibo(n - 1) + recurFibo(n - 2);
    }