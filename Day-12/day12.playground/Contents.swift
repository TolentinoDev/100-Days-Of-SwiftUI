var favoriteMovie: String? = nil
favoriteMovie = "The Life of Brian"
if let movie = favoriteMovie {
    print("Your favorite movie is \(movie).")
} else {
    print("You don't have a favorite movie.")
}

var weatherForecast: String? = "sunny"
if let forecast = weatherForecast {
    print("The forecast is \(forecast).")
} else {
    print("No forecast available.")
}


let song: String? = "Shake it Off"
if let unwrappedSong = song {
    print("The name has \(unwrappedSong.count) letters.")
}

var score: Int? = nil
score = 556
if let playerScore = score {
    print("You scored \(playerScore) points.")
}

let userAge: Int? = 38
if let age = userAge {
    print("You are \(age) years old.")
}

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}


func playOpera(by composer: String?) -> String? {
    guard let composer = composer else {
        return "Please specify a composer."
    }
    if composer == "Mozart" {
        return "Le nozze di Figaro"
    } else {
        return nil
    }
}
if let opera = playOpera(by: "Mozart") {
    print(opera)
}



let legoBricksSold: Int? = 400_000_000_000
let numberSold = legoBricksSold!


