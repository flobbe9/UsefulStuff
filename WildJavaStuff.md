# Lambdas
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
    

# Spring
### Cors
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
     * Use this if spring security is used. In filter chain: http.cors(cors -> cors.configurationSource(customCorsConfig())).
     */
    private CorsConfigurationSource customCorsConfig() {

        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Arrays.asList("http://localhost:3001"));
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "UPDATE", "DELETE"));
        configuration.setAllowedHeaders(Arrays.asList("*"));
        
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/api/appUser/**", configuration);

        return source;
    }


    /**
     * Configure CORS. 
     * Use this with spring cloud
     */
    @Bean
    CorsWebFilter corsWebFilter() {
        
        CorsConfiguration corsConfig = new CorsConfiguration();
        corsConfig.setAllowedOrigins(List.of("http://localhost:3000"));
        corsConfig.addAllowedMethod(HttpMethod.GET.name());
        corsConfig.addAllowedMethod(HttpMethod.POST.name());
        corsConfig.addAllowedMethod(HttpMethod.PUT.name());
        corsConfig.addAllowedMethod(HttpMethod.DELETE.name());
        corsConfig.addAllowedMethod(HttpMethod.OPTIONS.name());
        corsConfig.addAllowedHeader("*");
        corsConfig.setAllowCredentials(true);

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", corsConfig);

        return new CorsWebFilter(source);
    }