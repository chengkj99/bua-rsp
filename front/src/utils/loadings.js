import { observable, computed, action } from 'mobx'

export class Loadings {
  state = observable.map()

  @computed get names() {
    return this.state.keys()
  }

  constructor(...names) {
    names.forEach(name => this.add(name))
  }

  @action add(name) {
    if (!this.state.has(name)) {
      this.state.set(name, false)
    }
  }

  @action start(name) {
    this.state.set(name, true)
  }

  @action stop(name) {
    this.state.set(name, false)
  }

  isLoading(name) {
    return this.state.get(name)
  }

  isFinished(name) {
    return !this.isLoading(name)
  }

  isAllFinished() {
    return this.names.reduce(
      (finished, name) => finished && this.isFinished(name),
      true
    )
  }

  promise(name, promise) {
    this.start(name)
    const stopLoading = () => this.stop(name)
    promise.then(stopLoading, stopLoading)
    return promise
  }
}
