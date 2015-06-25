package it.redhat.demo.bpm.model;

import java.io.Serializable;

/**
 * Created by foogaro on 25/06/15.
 */
public class HardwareRequest implements Serializable {

    private final Integer days;
    private final Integer numberOfHost;
    private final HostSize hostSize;

    public enum HostSize {

        SMALL("S"), MEDIUM("M"), LARGE("L"), EXTRA_LARGE("XL");

        private String size;

        HostSize(String size) {
            this.size = size;
        }
    }

    public HardwareRequest(Integer days, Integer numberOfHost, HostSize hostSize) {
        this.days = days;
        this.numberOfHost = numberOfHost;
        this.hostSize = hostSize;
    }

    public Integer getDays() {
        return days;
    }

    public Integer getNumberOfHost() {
        return numberOfHost;
    }

    public HostSize getHostSize() {
        return hostSize;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("NewRequest{");
        sb.append("days=").append(days);
        sb.append(", numberOfHost=").append(numberOfHost);
        sb.append(", hostSize=").append(hostSize);
        sb.append('}');
        return sb.toString();
    }
}
