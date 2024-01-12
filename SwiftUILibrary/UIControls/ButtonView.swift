//
//  ButtonView.swift
//  SwiftUILibrary
//
//  Created by Mayur Nilwant on 10/01/2024.
//

import SwiftUI


struct AppColors {
    
    static let appThemeCOlor = Color.blue
}


enum ButtonTypeForApp   {
    
    case buttonWithTextAndBorder(String,CGFloat)
    case buttonWIthImageAndTitle(String, String, CGFloat)
    case circularButtonWithImage(String)
    case capsuleButton(String)
    case rectangularButton(String)
    
}

struct MNButtonView: View {
    
    private var buttonType: ButtonTypeForApp
    var callBack: ()-> Void
    
    
    init(withButtonType bType: ButtonTypeForApp, andCallBack callBack: @escaping ()-> Void) {
        self.buttonType = bType
        self.callBack = callBack
        
    }
    var body: some View {
        
        switch self.buttonType {
        case .buttonWithTextAndBorder(let title,_):
            do {
                
                Button  {
                    self.callBack()
                } label: {
                    Text(title)
                }
                .padding(10)
                .background{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(AppColors.appThemeCOlor, lineWidth: 2)
                }
                
            }
        case .buttonWIthImageAndTitle(let title,let imageName, _ ):
            do {
                Button {
                    self.callBack()
                } label: {
                    HStack {
                        Image(systemName: imageName)
                        Text(title)
                    }
                }
                .padding(10)
                .background{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(AppColors.appThemeCOlor, lineWidth: CGFloat(2))
                }
            }
        case .circularButtonWithImage(let _imgName):
            do {
                Button {
                    
                    self.callBack()
                } label: {
                    Image(systemName: _imgName)
                        .clipShape(Circle())
                }
            }
        case .capsuleButton(let title):
            Button(title) {
                self.callBack()
                
            }
            .buttonStyle(CapsuleButton())
            
        case .rectangularButton(let title):
            Button(action: {
                
            }, label: {
                Text(title)
                    .padding(10)
                    .foregroundColor(AppColors.appThemeCOlor)
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(AppColors.appThemeCOlor, lineWidth: 2.0)
                    }
                
                    
            })
        }
        
    }
}


struct CapsuleButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding([.leading,.trailing], 20)
            .padding([.top, .bottom], 10)
            .foregroundStyle(.white)
            .background(AppColors.appThemeCOlor)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}


struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack(spacing: 15) {
            Spacer()
            MNButtonView(withButtonType: ButtonTypeForApp.buttonWithTextAndBorder("Take a photo", 1)) {
                //Click Event
            }
            MNButtonView(withButtonType: ButtonTypeForApp.buttonWIthImageAndTitle("take a photo", "camera.circle.fill", 2)){
                //Click Event
            }
            MNButtonView(withButtonType: ButtonTypeForApp.circularButtonWithImage("plus.circle")){
                //Click Event
                
            }
            MNButtonView(withButtonType: .capsuleButton("Click")){
                //Click Event
            }
            MNButtonView(withButtonType: ButtonTypeForApp.rectangularButton("Press"), andCallBack: {
                
                   
            })
            Spacer()
        }
        
        
    }
}


