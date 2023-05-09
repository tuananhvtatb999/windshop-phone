package com.windshop.phone.repository;

import com.windshop.phone.entity.SaleOrder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;

public interface SaleOrderRepository extends JpaRepository<SaleOrder, Integer> {

    Page<SaleOrder> findAllByUserIdAndStatusOrderByCreatedDateAsc(Integer userId, Integer status, Pageable pageable);

    @Query(value = "SELECT SUM(total) FROM tbl_saleorder WHERE MONTH(created_date) = :monthNow" +
            " AND YEAR (created_date) = :yearNow" +
            " AND status_order_code = 2", nativeQuery = true)
    BigDecimal sumTotalInMonth(@Param("monthNow") Integer monthNow, @Param("yearNow") Integer yearNow);

    @Query(value = "SELECT COUNT(*) FROM tbl_saleorder WHERE status_order_code = 2 " +
            "AND MONTH(created_date) = :monthNow AND YEAR (created_date) = :yearNow", nativeQuery = true)
    Integer quantityOrder(@Param("monthNow") Integer monthNow, @Param("yearNow") Integer yearNow);

    @Query(value = "SELECT sum(sop.quantity) FROM tbl_saleorder so\n" +
            "INNER JOIN tbl_saleorder_products sop on so.id = sop.saleorder_id\n" +
            " WHERE so.status_order_code = 2 AND MONTH(so.created_date) = :monthNow AND YEAR (so.created_date) = :yearNow", nativeQuery = true)
    Integer quantityProduct(@Param("monthNow") Integer monthNow, @Param("yearNow") Integer yearNow);

    @Query(value = "SELECT s.lastest_update_by from windshop_phone.tbl_saleorder s WHERE MONTH(created_date) = :monthNow" +
            " AND YEAR (created_date) = :yearNow" +
            " group by s.lastest_update_by" +
            " order by count(*) desc limit 1 ", nativeQuery = true)
    Integer getIdBestSeller(@Param("monthNow") Integer monthNow, @Param("yearNow") Integer yearNow);
}
