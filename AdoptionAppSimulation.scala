package com.example.simulations

import io.gatling.core.Predef._
import io.gatling.http.Predef._
import scala.concurrent.duration._

class AdoptionAppSimulation extends Simulation {

  val httpProtocol: io.gatling.http.protocol.HttpProtocolBuilder = http
    .baseUrl("http://localhost:8080/SpringMvcHelloWorld")
    .acceptHeader("application/json")
    .contentTypeHeader("application/json")
    .userAgentHeader("Gatling/HappyTailsAdoptionPerformanceTest")

  private val realFirstName = "Ansu"
  private val realLastName = "Ghimire"
  private val realFullName = s"$realFirstName $realLastName"
  private def uniqueSuffix(): String =
    scala.util.Random.alphanumeric.filter(_.isLetterOrDigit).take(4).mkString.toLowerCase
  private val testPassword = "AdoptionLover123!"
  private val realContactNumber = "984-150-1234"
  private val realHomeAddress = "456 Paw Print Lane, Sunnyvale, CA"
  private val dogToAdopt = "Dog-ID-42"
  private def applicationData(uniqueSuffix: String): String = {
    val email = s"${realFirstName.toLowerCase}.${realLastName.toLowerCase}.$uniqueSuffix@happytails.com"
    val baseLivingSituation = "House with fenced yard"
    s"""{
      "applicantName": "$realFullName",
      "applicantEmail": "$email",
      "contactNumber": "$realContactNumber",
      "address": "$realHomeAddress",
      "dogId": "$dogToAdopt",
      "livingSituation": "$baseLivingSituation"
    }""" }
  private val updatedDogToAdopt = "Dog-ID-77"
  private val updatedLivingSituation = "Apartment, will hire dog walker"
  private def updatedApplicationData(uniqueSuffix: String): String = {
    val email = s"${realFirstName.toLowerCase}.${realLastName.toLowerCase}.$uniqueSuffix@happytails.com"
    s"""{
      "applicantName": "$realFullName",
      "applicantEmail": "$email",
      "contactNumber": "$realContactNumber",
      "address": "$realHomeAddress",
      "dogId": "$updatedDogToAdopt",
      "livingSituation": "$updatedLivingSituation"
    }"""
  }
  private val invalidApplicationData =
    s"""{
      "applicantName": "Invalid User",
      "applicantEmail": "noaddress@happytails.com",
      "contactNumber": "555-000-0000",
      "dogId": "Dog-ID-00",
      "livingSituation": "Unknown"
    }"""

  val scn: io.gatling.core.structure.ScenarioBuilder = scenario("Adoption Application Lifecycle Test")
    .exec(session => {
      val suffix = uniqueSuffix()
      val username = s"${realFirstName.toLowerCase}.${realLastName.toLowerCase}.$suffix@happytails.com"

      session.set("username", username)
        .set("applicationData", applicationData(suffix))
        .set("updatedApplicationData", updatedApplicationData(suffix))
    })

    .exec(http("Auth - Register Adopter")
      .post("/api/auth/register")
      .body(StringBody(s"""{"username": "$${username}", "password": "$testPassword"}"""))
      .check(status.in(201))
    )
    .exec(http("Auth - Login Adopter")
      .post("/api/auth/login")
      .body(StringBody(s"""{"username": "$${username}", "password": "$testPassword"}"""))
      .check(status.is(200))
      .check(jsonPath("$.token").exists.saveAs("jwtToken"))
    )

    .exec(http("CRUD - 1. POST Application (CREATE)")
      .post("/api/applications")
      .header("Authorization", "Bearer ${jwtToken}")
      .body(StringBody("${applicationData}"))
      .check(status.is(201))
      .check(jsonPath("$.applicationId").exists.saveAs("applicationId"))
    )

    .exec(http("CRUD - 2. GET My Application (READ)")
      .get("/api/applications/${applicationId}")
      .header("Authorization", "Bearer ${jwtToken}")
      .check(status.is(200))
      .check(jsonPath("$.dogId").is(dogToAdopt))
    )

    .exec(http("CRUD - 3. PUT Application (UPDATE)")
      .put("/api/applications/${applicationId}")
      .header("Authorization", "Bearer ${jwtToken}")
      .body(StringBody("${updatedApplicationData}"))
      .check(status.is(200))
      .check(jsonPath("$.dogId").is(updatedDogToAdopt))
    )

    .exec(http("Security - 1. GET All Applications (No Token)")
      .get("/api/applications")
      .check(status.is(403))
    )
    .exec(http("Validation - 2. POST Application (Invalid Data)")
      .post("/api/applications")
      .header("Authorization", "Bearer ${jwtToken}")
      .body(StringBody(invalidApplicationData))
      .check(status.is(400))
    )
    .exec(http("CRUD - 4. DELETE Application (WITHDRAW)")
      .delete("/api/applications/${applicationId}")
      .header("Authorization", "Bearer ${jwtToken}")
      .check(status.is(204))
    )
  setUp(
    scn.inject(rampUsers(25).during(10.seconds))
      .protocols(httpProtocol)
  )
    .maxDuration(90.seconds)
}


