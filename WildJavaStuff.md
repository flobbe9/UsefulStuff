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

### Spring
    ```
    /**
     * Cors config as bean
     * Use this if spring security is not used.
     */
    @Bean
    WebMvcConfigurer corsConfigurer() {

        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**")
                        .allowedOrigins("http://localhost:3001")
                        .allowedMethods("GET", "POST", "UPDATE", "DELETE")
                        .allowedHeaders("*");
            }
        };
    }


    /**
     * Cors config to inject in security filter chain.
     * Use this if spring security is used.
     */
    private CorsConfigurationSource corsConfigurationSource() {

        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Arrays.asList("http://localhost:3001"));
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "UPDATE", "DELETE"));
        configuration.setAllowedHeaders(Arrays.asList("*"));
        
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/api/appUser/**", configuration);

        return source;
    }
    ```