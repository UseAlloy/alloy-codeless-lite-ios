//
//  ContentView.swift
//  AlloyCodelessLiteiOSDemo
//

import AlloyCodelessLiteiOS
import SwiftUI

struct ContentView: View {

@State private var startAlloy = false
@State private var resumeJourney = false
@State private var textResul: String?
@State private var resultJourney: JourneyDataResponse?
@State private var showResultJourney: Bool = false
@State private var disabledResume: Bool = true

var body: some View {
    VStack(spacing: 20) {
        Spacer()
        Image("Logo")
            .renderingMode(.original)
            .resizable()
            .frame(width: 150, height: 150)
            .padding(.vertical, 32)

        Text("**Alloy Codeless Demo**")
            .font(.system(size: 24))
        Spacer()
        VStack (spacing: 24) {
            Button {
                Task {
                        // Setup Alloy configuration
                        //"028d85e0-aa24-4ca1-99f2-90e3ee3f4e6b"
                        //"28645602-9560-4c33-aec8-2f4104f6e6ac"
                        //a3cbb53c-8fae-409c-9ee1-35bb60bd6107
                    let alloySettings = AlloySettings(
                        apiKey: "a3cbb53c-8fae-409c-9ee1-35bb60bd6107",
                        production: true,
                        realProduction: false,
                        codelessFinalValidation: false
                    )

                    let authInitResult: AuthInitResult = try await AlloyCodelessLiteiOS.shared.authInit(alloySettings: alloySettings)
                    if authInitResult.resultCode == AuthInitResultErrorCode.RESULT_ERROR {
                        textResul = "Result SDK init: \(authInitResult.resultMessage)"
                        print("Init SDK ERROR: \(authInitResult.resultMessage)")
                    } else {
                        startAlloy.toggle()
                        print("Init SDK OK: \(authInitResult)")
                    }
                }
            } label: {
                HStack() {
                    Image(systemName: "play.circle")
                        .padding(.leading, 16)
                    Text("Start Alloy")
                        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 64, alignment: .leading)
                }
            }
            .background(.white)
            .foregroundColor(.black)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.gray, lineWidth: 1))

            Button {
                    //SOCURE SDK JOURNEY: J-4VGaFh2Cfl8wHF08vSLA
                    //DOCV SDK JOURNEY: J-59H8fV7Ft6jI5AoMrrwi
                Task {
                    if !resumeJourney {
                        resumeJourney.toggle()
                        let entityDataPerson = Entity.EntityData(nameFirst: "John", nameLast: "Random6")
                        let entityPerson = Entity(entityData: entityDataPerson, entityType: "person", branchName: "persons")
                        let entityDataPerson2 = Entity.EntityData(nameFirst: "Mary", nameLast: "Random6 Random6")
                        let entityPerson2 = Entity(entityData: entityDataPerson2, entityType: "person", branchName: "persons")

                        let entities = EntityData(entities: [entityPerson, entityPerson2], additionalEntities: false)
                        let journeySettings = JourneySettings(journeyToken: "J-59H8fV7Ft6jI5AoMrrwi", entities: entities)
                            // AlloyCodeless.shared.setKeySocureSDK(apiKey: "3083d83f-6d7d-4dd1-a06e-434d9a2d5031")
                            // AlloyCodeless.shared.setKeySocureSDK(apiKey: "49b2a770-0540-400b-a7a7-4da404445270")
                        let journeyResult = try await AlloyCodelessLiteiOS.shared.startJourney(journeySettings: journeySettings, onFinish: { _ in
                            showResultJourney.toggle()
                        })
                        if let resultJourney = journeyResult?.journeyResultData {
                            self.resultJourney = resultJourney
                        }
                        if journeyResult?.resultCode == StartJourneyResultErrorCode.RESULT_ERROR {
                            textResul = "\(journeyResult?.resultMessage ?? "")"
                            print ("\(journeyResult?.resultMessage ?? "")")
                        } else {
                            if let journeyResult = journeyResult {
                                print("Result: The Journey has been init sucessfull \(journeyResult)")
                            }
                        }
                    } else {
                        try await AlloyCodelessLiteiOS.shared.checkStatusJourney(onFinish: { result in
                            showResultJourney.toggle()
                        })
                    }
                }
            } label: {
                HStack() {
                    Image(systemName: "point.3.connected.trianglepath.dotted")
                        .padding(.leading, 16)
                        .tint( startAlloy ? .black : .white)
                    Text(resumeJourney ? "Resume Journey" : "Start Journey")
                        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 64, alignment: .leading)
                }
            }
            .background(startAlloy ? .white : Color(uiColor: UIColor(red: 0.70, green: 0.70, blue: 0.70, alpha: 1.00)))
            .foregroundColor(startAlloy ? .black : .white)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.gray))
            .disabled(!startAlloy)
        }

        Spacer()

    }
    .padding(.horizontal, 32)

    .onChange(of: showResultJourney) { _ in
        Task {
            do {
                print(" --- JOURNEY IN PROGESS ----------")
                guard let data = try await AlloyCodelessLiteiOS.shared.getJourneyData() else { return }
                print("\(data)")
            }
        }
    }
}
}

struct ContentView_Previews: PreviewProvider {
static var previews: some View {
    ContentView()
}
}
