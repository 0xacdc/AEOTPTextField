//
//  SwiftUIView.swift
//  AEOTPTextFieldExample
//
//  Created by Abdelrhman Eliwa on 01/06/2022.
//
import SwiftUI
import AEOTPTextField

struct SwiftUIView: View {
    // MARK: - PROPERTIES
    //
    @State private var otp: String = ""
    @State private var alertIsPresented: Bool = false
    
    // MARK: - BODY
    //
    var body: some View {
        VStack(alignment: .leading) {
            Text("Please, enter the code")
                .padding(.top, 60)
                .padding(.leading, 16)
            
            
            AEOTPView(text: $otp, height: 50, otpDefaultCharacter: "-", otpDefaultCharacterColor: .blue, otpFilledBackgroundColor: .green, otpDefaultBorderColor: UIColor.gray, otpDefaultBorderWidth: 3) {
                alertIsPresented = true
            } //: AEOTPView
            .padding()
            
            Spacer()
        } //: VStack
        .alert(isPresented: $alertIsPresented) {
            otpAlert
        } //: alert
    } //: body
    
    private var otpAlert: Alert {
        Alert(
            title: Text("Verify Result"),
            message: Text(otp == "123456" ? "Success" : "Failure"),
            dismissButton: .default(Text("Done"), action: {
                alertIsPresented = false
            })
        )
    } //: otpAlert
}

