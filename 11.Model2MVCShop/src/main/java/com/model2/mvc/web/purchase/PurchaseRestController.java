package com.model2.mvc.web.purchase;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {
	
	///Field
	@Autowired @Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
  
	@Autowired @Qualifier("productServiceImpl")
	private ProductService productService;
		
	public PurchaseRestController(){
		System.out.println(this.getClass());
	}

	@RequestMapping(value="json/addPurchase/{prodNo}", method = RequestMethod.POST)
	public Purchase addPurchase( @RequestBody Purchase purchase,  @PathVariable int prodNo) throws Exception {

		System.out.println("/purchase/addPurchase : POST");
		User user = new User();
		user.setUserId("user01");
		user.setPassword("1111");
		
		purchase.setBuyer(user);
		purchase.setPurchaseProd(productService.getProduct(prodNo));
		
		System.out.println("purchase"+purchase);
		purchaseService.addPurchase(purchase);

	
		return purchase;
	}
	
	
	@RequestMapping(value="json/getPurchase/{tranNo}", method = RequestMethod.GET)
	public Purchase getPurchase( @PathVariable int tranNo ) throws Exception{
		
		System.out.println("/purchase/json/getPurchase : GET");
		
		return purchaseService.getPurchase(tranNo);
	}


//	@RequestMapping(value="json/getPurchase/{tranNo}", method=RequestMethod.POST )
//	public Purchase getPurchase( @PathVariable int tranNo  ) throws Exception{
//		
//		System.out.println("/purchase/json/getPurchase : POST");
//		
//		return purchaseService.getPurchase(tranNo);
//	}
	
	@RequestMapping(value="json/updatePurchase/{prodNo}", method=RequestMethod.POST)
	public Purchase updatePurchase(@RequestBody Purchase purchase,@PathVariable int prodNo) throws Exception{

		System.out.println("/purchase/json/updatePurchase: POST");
		User user = new User();
		user.setUserId("user01");
	
		purchase.setBuyer(user);
		purchase.setPurchaseProd(productService.getProduct(prodNo));
		
		purchaseService.updatePurchase(purchase);
		
		return purchase;
	}
	
	
	@RequestMapping(value="json/listPurchase", method=RequestMethod.POST)
	public Map listPurchase(@RequestBody Search search) throws Exception{
		int pageSize = 3;
		int pageUnit = 5;
		
		System.out.println("/purchase/json/listPurchase: POST");
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		if(search.getSearchCondition() ==null) {
			search.setSearchCondition("0");
		}
		
		if(search.getSearchKeyword()==null) {
			search.setSearchKeyword("");
		}
		System.out.println("search"+search);
		search.setPageSize(pageSize);
		
		User user = new User();
		user.setUserId("user01");
		
		// Business logic 수행
		Map<String , Object> map=purchaseService.getPurchaseList(search, user.getUserId());
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);

		return map;
	}
}