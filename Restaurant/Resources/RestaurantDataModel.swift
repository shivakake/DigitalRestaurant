//
//  RestaurantDataModel.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 01/06/23.
//

import Foundation

public struct CategoriesDataModel {
    
    public var image: String?
    public var title: String?
    public var isSelected: Bool?
    
    public init() {}
    public init(image: String?, title: String?, isSelected: Bool?) {
        self.image = image
        self.title = title
        self.isSelected = isSelected
    }
}

public struct RecommendedListDataModel {
    
    public var image: String?
    public var title: String?
    public var liked: Bool?
    public var rating: String?
    public var price: String?
    public var deliveryTime: String?
    public var quantity: Int?
    
    public init() { }
    public init(image: String?, title: String?, liked: Bool?, rating: String?, price: String?, deliveryTime: String?, quantity: Int?) {
        self.image = image
        self.title = title
        self.liked = liked
        self.rating = rating
        self.price = price
        self.deliveryTime = deliveryTime
        self.quantity = quantity
    }
}


public struct NotificationDataModel {
    
    public var image: String?
    public var title: String?
    public var description: String?
    
    public init() { }
    public init(image: String?, title: String?, description: String?) {
        self.image = image
        self.title = title
        self.description = description
    }
}

public struct ReviewDataModel {
    
    public var image: String?
    public var title: String?
    public var description: String?
    public var rating: String?
    public var likedCount: String?
    public var date: String?
    public var peopleCount: String?
    
    public init() { }
    public init(image: String?, title: String?, description: String?,rating: String?, likedCount: String?, date: String?,peopleCount: String?) {
        self.image = image
        self.title = title
        self.description = description
        self.rating = rating
        self.likedCount = likedCount
        self.date = date
        self.peopleCount = peopleCount
    }
}

public struct ReservationDataModel {
    
    public var image: String?
    public var title: String?
    public var day: String?
    public var time: String?
    public var persons: String?
    
    public init() { }
    public init(image: String?, title: String?, day: String?,time: String?, persons: String?) {
        self.image = image
        self.title = title
        self.day = day
        self.time = time
        self.persons = persons
    }
}

public struct ProfileSettingsDataModel {
    
    public var image: String?
    public var title: String?
    
    public init() { }
    public init(image: String?, title: String?) {
        self.image = image
        self.title = title
    }
}


public struct FevoriteListDataModel {
    
    public var image: String?
    public var title: String?
    public var liked: Bool?
    public var foodType: String?
    public var rating: String?
    public var price: String?
    public var deliveryTime: String?
    public var quantity: Int?
    
    public init() { }
    public init(image: String?, title: String?, liked: Bool?, foodType: String?, rating: String?, price: String?, deliveryTime: String?, quantity: Int?) {
        self.image = image
        self.title = title
        self.liked = liked
        self.foodType = foodType
        self.rating = rating
        self.price = price
        self.deliveryTime = deliveryTime
        self.quantity = quantity
    }
}

public struct LanguageListDataModel {
    
    public var languageLetterImage: String?
    public var languageTitleImage: String?
    public var isSelected: Bool?
    
    public init() { }
    public init(languageLetterImage: String?, languageTitleImage: String?, isSelected: Bool?) {
        self.languageLetterImage = languageLetterImage
        self.languageTitleImage = languageTitleImage
        self.isSelected = isSelected
    }
}

public struct DiscountsListDataModel {
    
    public var discountImage: String?
    public var discountTitle: String?
    public var discountDetails: String?
    public var isSelected: Bool?
    
    public init() { }
    public init(discountImage: String?, discountTitle: String?, discountDetails: String?, isSelected: Bool?) {
        self.discountImage = discountImage
        self.discountTitle = discountTitle
        self.discountDetails = discountDetails
        self.isSelected = isSelected
    }
}


public struct OrdersListDataModel {
    
    public var orderImage: String?
    public var orderTitle: String?
    public var ordersCount: String?
    public var ordersPrice: String?
    public var isPaid: Bool?
    
    public init() { }
    public init(orderImage: String?, orderTitle: String?, ordersCount: String?, ordersPrice: String?, isPaid: Bool?) {
        self.orderImage = orderImage
        self.orderTitle = orderTitle
        self.ordersCount = ordersCount
        self.ordersPrice = ordersPrice
        self.isPaid = isPaid
    }
}

public struct CartListDataModel {
    
    public var image: String?
    public var title: String?
    public var isDeleted: Bool?
    public var deliveryTime: String?
    public var calories: String?
    public var price: String?
    public var quantity: Int?
    
    public init() { }
    public init(image: String?, title: String?, isDeleted: Bool?, deliveryTime: String?, calories: String?, price: String?, quantity: Int?) {
        self.image = image
        self.title = title
        self.isDeleted = isDeleted
        self.deliveryTime = deliveryTime
        self.calories = calories
        self.price = price
        self.quantity = quantity
    }
}

public struct PaymentMethodDataModel {
    
    public var image: String?
    public var title: String?
    
    public init() {}
    public init(image: String?, title: String?) {
        self.image = image
        self.title = title
    }
}
