/*
Authored by Greg Bevington, fall 2023. This is a REST service to access and serve country and province data from the "Travel Experts" database
*/

package com.example.restservice;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

@Path("/location")
public class LocationService {
    // return country codes and names
    @GET
    @Path("/countries")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getCountries(){
        List<Country> countries = retrieveCountryData();

        return Response.ok(countries).build();
    }

    // return province codes and names
    @GET
    @Path("/provinces/{countryCode}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getProvinces(@PathParam("countryCode") String countryCode){
        List<Province> provinces = retrieveProvinceData(countryCode);

        return Response.ok(provinces).build();
    }

    private List<Province> retrieveProvinceData(String countryCode) {
        List<Province> provinces = new ArrayList<>();

        try (Connection connection = getDatabaseConnection()){
            String sql = "SELECT ProvinceCode, ProvinceName FROM Province WHERE CountryCode = ?";
            try(PreparedStatement preparedStatement = connection.prepareStatement(sql)){
                preparedStatement.setString(1, countryCode);

                try(ResultSet resultSet = preparedStatement.executeQuery()){
                    while (resultSet.next()){
                        String provinceCode = resultSet.getString("ProvinceCode");
                        String provinceName = resultSet.getString("ProvinceName");
                        provinces.add(new Province(provinceCode, provinceName, countryCode));
                    }
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return provinces;
    }

    private List<Country> retrieveCountryData(){
        List<Country> countries = new ArrayList<>();

        try (Connection connection = getDatabaseConnection()){
            String sql = "SELECT CountryCode, CountryName FROM Country";
            try(Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(sql)) {
                while (resultSet.next()) {
                    String countryCode = resultSet.getString("CountryCode");
                    String countryName = resultSet.getString("CountryName");
                    Country country = new Country(countryCode, countryName);
                    countries.add(country);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return countries;
    }

    public Connection getDatabaseConnection() {
        Properties properties = new Properties();
        try (FileInputStream fis = new FileInputStream("C:\\Users\\PC1\\Documents\\connection.properties")) {

            properties.load(fis);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        String url = properties.getProperty("url");
        String user = properties.getProperty("user");
        String password = properties.getProperty("password");

        try {
            return DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}