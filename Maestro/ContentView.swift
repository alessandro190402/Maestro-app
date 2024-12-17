//
//  ContentView.swift
//  Maestro
//
//  Created by Alessandro Abbatiello on 05/12/24.
//

import SwiftUI

@main
struct AccessibleQuotesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// MARK: - Main Content
struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to Maestro!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom, 20)

                Image(systemName: "brain.head.profile.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 130)
                    .foregroundColor(.blue)
                    .padding()

                NavigationLink(destination: QuotesView()) {
                    Text("Discover Quotes")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .padding()
            .navigationTitle("Home")
        }
    }
}

// MARK: - Quotes View
struct QuotesView: View {
    @State private var currentQuote: String = "Life is what happens when you're busy making other plans."

    private let quotes = [
        "Life is like riding a bicycle. To keep your balance, you must keep moving.",
        "Never stop dreaming, even when it feels impossible.",
        "Every day is a new opportunity to do better than yesterday.",
        "Success is the sum of small efforts repeated day in and day out.",
        "Don’t wait. The perfect moment will never come.",
        "Make your life a dream, and a dream a reality.",
        "I'm gonna make him an offer he can't refuse. (The Godfather - 1972)",
        "You don't understand! I coulda had class. I coulda been a contender. I could've been somebody, instead of a bum, which is what I am. (On the Waterfront - 1954)",
        "May the Force be with you. (Star Wars - 1977)",
        "You're not alone, you're not special, you're just a human being trying to make sense of the world.",
        "Life is a journey, not a destination",
        "I love you 3000 (Avengers Endgame - 2019)",
        "Carpe diem. Seize the day, boys. Make your lives extraordinary. (Dead Poets Society - 1989)",
        "Love means never having to say you're sorry. (Love Story - 1970)",
        "Keep your friends close, but your enemies closer. (The Godfather part II - 1974)",
        "We cannot solve problems with the kind of thinking we employed when we came up with them.",
        "Learn as if you will live forever, live like you will die tomorrow.",
        "Stay away from those people who try to disparage your ambitions. Small minds will always do that, but great minds will give you a feeling that you can become great too.",
        "When you give joy to other people, you get more joy in return. You should give a good thought to the happiness that you can give out.",
        "When you change your thoughts, remember to also change your world.",
        "It is only when we take chances that our lives improve. The initial and the most difficult risk we need to take is to become honest.",
        "Nature has given us all the pieces required to achieve exceptional wellness and health, but has left it to us to put these pieces together.",
        "It is remarkable how much long-term advantage people like us have gotten by trying to be consistently not stupid, instead of trying to be very intelligent.",
        "You can’t be that kid standing at the top of the waterslide, overthinking it. You have to go down the chute.",
        "When I believe in something, I’m like a dog with a bone.",
        "And the day came when the risk to remain tight in a bud was more painful than the risk it took to blossom.",
        "The standard you walk past is the standard you accept.",
        "I’ve searched all the parks in all the cities and found no statues of committees.",
        "Success is stumbling from failure to failure with no loss of enthusiasm.",
        "Keep your eyes on the stars, and your feet on the ground.",
        "Do not stop thinking of life as an adventure. You have no security unless you can live bravely, excitingly, imaginatively; unless you can choose a challenge instead of competence.",
        "Perfection is not attainable. But if we chase perfection we can catch excellence.",
        "Get a good idea and stay with it. Dog it, and work at it until it’s done right.",
        "Optimism is the faith that leads to achievement. Nothing can be done without hope and confidence.",
        "The elevator to success is out of order. You’ll have to use the stairs, one step at a time.",
        "Be a positive energy trampoline, absorb what you need and rebound more back.",
        "Work until your bank account looks like a phone number.",
        "I am so clever that sometimes I don’t understand a single word of what I am saying.",
        "People say nothing is impossible, but I do nothing every day.",
        "Life is like a sewer … what you get out of it depends on what you put into it.",
        "I always wanted to be somebody, but now I realize I should have been more specific."
    ]

    var body: some View {
        VStack(spacing: 20) {
            Text("Enjoy Maestro!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Text(currentQuote)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.horizontal)

            Button(action: generateNewQuote) {
                Text("New Quote")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }

            // Sezione per pulsanti di accessibilità
            VStack(spacing: 10) {
                Button(action: {
                    // Placeholder: Azione per attivare il VoiceOver
                }) {
                    Label("Enable VoiceOver", systemImage: "speaker.wave.3.fill")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                .accessibilityLabel("Enable VoiceOver")
                .accessibilityHint("Placeholder for enabling VoiceOver functionality.")

                Button(action: {
                    // Placeholder: Azione per cambiare la velocità della lettura
                }) {
                    Label("Adjust Reading Speed", systemImage: "speedometer")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                .accessibilityLabel("Adjust Reading Speed")
                .accessibilityHint("Placeholder for adjusting the speed of reading.")
            }
        }
        .padding()
        .navigationTitle("Quotes")
    }

    func generateNewQuote() {
        currentQuote = quotes.randomElement() ?? currentQuote
    }
}
