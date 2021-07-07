//
//  Component.swift
//  UDF
//
//  Created by Anton Goncharov on 16.10.2020.
//
import Foundation

/// Parent protocol for components. Use ``ViewComponent`` or ``ServiceComponent`` for your component.
public protocol Component: AnyObject {

    associatedtype Props: Equatable

    var queue: DispatchQueue { get }
    var props: Props { get set }
    var disposer: Disposer { get }

    /// Connects a component to a store.
    ///
    /// - Parameters:
    ///   - store: A ``Store`` to connect to.
    ///   - stateToProps: A closure that transforms the `Component`'s `State` into a `Props` of the `Component`.
    ///   - transform: A closure that transforms the `Store`'s `State` to a `State` of the `Component`.
    func connect<State, ConnectorState>(
        to store: Store<State>,
        stateToProps: @escaping (ConnectorState, ActionDispatcher) -> Props,
        transform: @escaping (State) -> ConnectorState)
}

public extension Component {

    /// Connects a component to a store when Component`'s `Props` is equal to `Store`'s `State`.
    ///
    /// - Parameters:
    ///   - store: A `Store` to connect to.
    func connect<State>(to store: Store<State>) where State == Props {
        connect(to: store) { state, _ in state }
    }

    /// Connects a component to a store with whole `Store`'s `State`.
    ///
    /// - Parameters:
    ///   - store: A `Store` to connect to.
    ///   - stateToProps: A closure that transforms the `Store`'s `State` into a `Props` of the `Component`.
    func connect<State>(
        to store: Store<State>,
        stateToProps: @escaping (State, ActionDispatcher) -> Props) {
        connect(to: store, stateToProps: stateToProps) { $0 }
    }

    /// Connects a component to a store with a keypath.
    ///
    /// - Parameters:
    ///   - store: A `Store` to connect to.
    ///   - stateToProps: A closure that transforms the `Component`'s `State` into a `Props` of the `Component`.
    ///   - keypath: A keypath for a `State` of the `Component`.
    func connect<State, ConnectorState>(
        to store: Store<State>,
        stateToProps: @escaping (ConnectorState, ActionDispatcher) -> Props,
        state keypath: KeyPath<State, ConnectorState>) {
        connect(to: store, stateToProps: stateToProps) { $0[keyPath: keypath] }
    }
}

public extension Component {

    /// Connects a component to a store using a connector with whole `Store`'s `State`.
    ///
    /// - Parameters:
    ///   - store: A `Store` to connect to.
    ///   - by: A `Connector` that transforms State to Props.
    func connect<State, ConnectorType: Connector>(
        to store: Store<State>,
        by connector: ConnectorType
    ) where ConnectorType.State == State, ConnectorType.Props == Props {
        connect(to: store, by: connector) { $0 }
    }

    /// Connects a component to a store using a connector and a keypath.
    ///
    /// - Parameters:
    ///   - store: A `Store` to connect to.
    ///   - by: A `Connector` that transforms State to Props.
    ///   - keypath: A keypath for a `State` of the `Component`.
    func connect<State, ConnectorType: Connector>(
        to store: Store<State>,
        by connector: ConnectorType,
        state keypath: KeyPath<State, ConnectorType.State>
    ) where ConnectorType.Props == Props {
        connect(to: store, by: connector) { $0[keyPath: keypath] }
    }

    /// Connects a component to a store using a connector.
    ///
    /// - Parameters:
    ///   - store: A `Store` to connect to.
    ///   - by: A `Connector` that transforms State to Props.
    ///   - transform: A closure that transforms the `Store`'s `State` to a `State` of the `Connector`.
    func connect<State, ConnectorType: Connector>(
        to store: Store<State>,
        by connector: ConnectorType,
        transform: @escaping (State) -> ConnectorType.State
    ) where ConnectorType.Props == Props {
        connect(to: store, stateToProps: connector.stateToProps, transform: transform)
    }
}

public extension Component where Self: Connector {
    /// Connects a component to a store when the `Component` is a `Connector`and with whole `Store`'s `State`.
    ///
    /// - Parameters:
    ///   - store: A `Store` to connect to.
    func connect<State>(to store: Store<State>) where Self.State == State {
        connect(to: store) { $0 }
    }

    /// Connects a component to a store when the `Component` is a `Connector`and with a keypath.
    ///
    /// - Parameters:
    ///   - store: A `Store` to connect to.
    ///   - keypath: A keypath for a `State` of the `Component`.
    func connect<State>(to store: Store<State>, state keypath: KeyPath<State, Self.State>) {
        connect(to: store) { $0[keyPath: keypath] }
    }

    /// Connects a component to a store when the `Component` is a `Connector`.
    ///
    /// - Parameters:
    ///   - store: A `Store` to connect to.
    ///   - transform: A closure that transforms the `Store`'s `State` to a `State` of the `Connector`.
    func connect<State>(to store: Store<State>, transform: @escaping (State) -> Self.State) {
        store.observe(on: queue) { [weak self] state in
            guard let self = self else { return }
            self.updateProps(state: state, stateToProps: self.stateToProps, dispatcher: store, transform: transform)
        }.dispose(on: disposer)
    }
}

public extension Component {
    func connect<State, ConnectorState>(
        to store: Store<State>,
        stateToProps: @escaping (ConnectorState, ActionDispatcher) -> Props,
        transform: @escaping (State) -> ConnectorState) {
        store.observe(on: queue) { [weak self] state in
            self?.updateProps(state: state, stateToProps: stateToProps, dispatcher: store, transform: transform)
        }.dispose(on: disposer)
    }
}

extension Component {
    func updateProps<State, ConnectorState>(
        state: State,
        stateToProps: @escaping (ConnectorState, ActionDispatcher) -> Props,
        dispatcher: ActionDispatcher,
        transform: @escaping (State) -> ConnectorState) {
        let componentState = transform(state)
        let newProps = stateToProps(componentState, dispatcher)
        guard props != newProps else { return }
        props = newProps
    }
}