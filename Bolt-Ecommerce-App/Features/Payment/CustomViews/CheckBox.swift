//
//  CheckBox.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/19/23.
//

import UIKit

@IBDesignable

open class CheckBox: UIControl {
    
    
    enum Style {
        case square
        case circle
        case cross
        case tick
    }
    
    enum BorderStyle {
        case square
        case roundedSquare(raduis: CGFloat)
        case rounded
    }
    
    //MARK: - Vars
    var style: Style = .circle
    var borderStyle: BorderStyle = .rounded
    
    @IBInspectable
    var borderWidth: CGFloat = 1.5
    //the size for rendering
    var checkmarkSize: CGFloat = 0.5
    
    @IBInspectable
    var checkedBorderColor: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    
    @IBInspectable
    var uncheckedBorderColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)

    @IBInspectable
    var checkMarkColor: UIColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
    
    var checkBoxBackgroundColor: UIColor = .white
    
    //Used to increase the touchable area for the component
    var increasedTouchRadius: CGFloat = 5
    
    var useHapticFeedback: Bool = true
    
    @IBInspectable
    //is an observable property, so we can render the change in check box’s state by using it
    var isChecked: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    //UIImpactFeedbackGenerator object to wake up the device engine to provide feed backs
    private var feedbackGenerator: UIImpactFeedbackGenerator?
    
    
    //MARK: Intialisers
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    
    private func setupViews() {
        self.backgroundColor = .clear
    }
    
    //MARK: - Helpers
    open override func draw(_ rect: CGRect) {
        
        let newRect = rect.insetBy(dx: borderWidth / 2, dy: borderWidth / 2)
        
        let context = UIGraphicsGetCurrentContext()!
        context.setStrokeColor(self.isChecked ? checkedBorderColor.cgColor : tintColor.cgColor)
        context.setFillColor(checkBoxBackgroundColor.cgColor)
        context.setLineWidth(borderWidth)
        
        var shapePath: UIBezierPath!
        
        switch self.borderStyle {
            
        case .square:
            shapePath = UIBezierPath(rect: newRect)
        case .roundedSquare(raduis: let raduis):
            shapePath = UIBezierPath(roundedRect: newRect, cornerRadius: raduis)
        case .rounded:
            shapePath = UIBezierPath.init(ovalIn: newRect)
        }
        
        context.addPath(shapePath.cgPath)
        context.strokePath()
        context.fillPath()
        
        //When it is selected, depends on the style
        //By using helper methods, draw the inner part of the component UI.
        if isChecked {
            
            switch self.style {
                
            case .square:
                self.drawInnerSquare(frame: newRect)
            case .circle:
                self.drawCircle(frame: newRect)
            case .cross:
                self.drawCross(frame: newRect)
            case .tick:
                self.drawCheckMark(frame: newRect)
            }
        }
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.setNeedsDisplay()
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setNeedsDisplay()
    }
    
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
           
           let relativeFrame = self.bounds
           let hitTestEdgeInsets = UIEdgeInsets(top: increasedTouchRadius, left: increasedTouchRadius, bottom: increasedTouchRadius, right: increasedTouchRadius)
           let hitFrame = relativeFrame.inset(by: hitTestEdgeInsets)
           return hitFrame.contains(point)
       }
    
    //Draws tick inside the component
    func drawCheckMark(frame: CGRect) {
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: frame.minX + 0.26000 * frame.width, y: frame.minY + 0.5000 * frame.height))
        
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.42000 * frame.width, y: frame.minY + 0.62000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.38000 * frame.width, y: frame.minY + 0.60000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.42000 * frame.width, y: frame.minY + 0.62000 * frame.height))
        
        bezierPath.addLine(to: CGPoint(x: frame.minX + 0.70000 * frame.width, y: frame.minY + 0.24000 * frame.height))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 0.78000 * frame.width, y: frame.minY + 0.30000 * frame.height))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 0.44000 * frame.width, y: frame.minY + 0.76000 * frame.height))

        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.20000 * frame.width, y: frame.minY + 0.58000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.44000 * frame.width, y: frame.minY + 0.76000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.26000 * frame.width, y: frame.minY + 0.62000 * frame.height))

        checkMarkColor.setFill()
        bezierPath.fill()

    }
    
    //Draws circle inside the component
    func drawCircle(frame: CGRect) {
        
        func fastFloor(_ x: CGFloat) -> CGFloat { return floor(x) }
        
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: frame.minX + fastFloor(frame.width * 0.22000 + 0.5), y: frame.minY + fastFloor(frame.height * 0.22000 + 0.5), width: fastFloor(frame.width * 0.76000 + 0.5) - fastFloor(frame.width * 0.22000 + 0.5), height: fastFloor(frame.height * 0.78000 + 0.5) - fastFloor(frame.height * 0.22000 + 0.5)))

        checkMarkColor.setFill()
        ovalPath.fill()

    }
    
    //Draws square inside the component
    func drawInnerSquare(frame: CGRect) {
        
        func fastFloor(_ x: CGFloat) -> CGFloat { return floor(x) }
        
        let padding = self.bounds.width * 0.3
        let innerRect = frame.inset(by: .init(top: padding, left: padding, bottom: padding, right: padding))
        let rectanglePath = UIBezierPath.init(roundedRect: innerRect, cornerRadius: 3)

        checkMarkColor.setFill()
        rectanglePath.fill()
    }
    
    //Draws cross inside the component
    func drawCross(frame: CGRect) {
        
        func fastFloor(_ x: CGFloat) -> CGFloat { return floor(x) }

        
    }

}
