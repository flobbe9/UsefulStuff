### Lambdas
    ```
    static void lambdaFunction(Runnable runnable) {
        // returns nothing
        runnable.run();
    }

    static <T> void labmdaFunction2(Supplier<T> supplier) {
        // returns something (T)
        System.out.println(supplier.get());
    }


    public static void main(String[] args) {
        lambdaFunction(() -> System.out.println(""));
        labmdaFunction2(() -> "");
    }
    
    ```