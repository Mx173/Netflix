//
//  NotificationBar.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/26.
//

import SwiftUI

struct NotificationBar: View {
    @Binding var showNotificationList: Bool
    
    var body: some View {
        Button {
            showNotificationList = true
        } label: {
            HStack {
                Image(systemName: "bell")
                Text("Notificatiions")
                Spacer()
                Image(systemName: "chevron.right")
            }
            .font(.system(size: 18, weight: .bold))
        }
        .foregroundColor(.white)
    }
}

#Preview {
    NotificationBar(showNotificationList: .constant(false))
        .background(.black)
}
